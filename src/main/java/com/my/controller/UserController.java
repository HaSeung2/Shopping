package com.my.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.domain.BuyProductDTO;
import com.my.domain.UserDTO;
import com.my.service.UserService;
import com.my.service.UserphoneService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {
	
	@Setter(onMethod_ = @Autowired)
	private UserphoneService service;
	
	@Setter(onMethod_ = @Autowired)
	private UserService services;

	@GetMapping({"/login","/join"})
	public void goLogin() {
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest resq) {
		HttpSession session = resq.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/join")
	public String join(UserDTO user, HttpServletResponse ra, RedirectAttributes rar) {
		if(services.join(user)) {
			Cookie joinid = new Cookie("joinid", user.getUseremail());
			joinid.setMaxAge(300);
			ra.addCookie(joinid);
			rar.addFlashAttribute("joinid", ra);
			return "/user/login";
		}
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(String useremail, String userpw, HttpServletRequest resq, RedirectAttributes ra) {
		HttpSession session = resq.getSession();
		UserDTO loginUser = services.login(useremail, userpw);
		if(loginUser != null) {
			session.setAttribute("loginUserid", loginUser.getUseremail());
			session.setAttribute("loginUsername", loginUser.getUsername());
			session.setAttribute("userpw", loginUser.getUserpw());
			session.setAttribute("userphone", loginUser.getUserphone());
			session.setAttribute("postnum", loginUser.getPostnum());
			session.setAttribute("addr", loginUser.getAddr());
			session.setAttribute("detailaddress", loginUser.getDetailaddress());
			session.setAttribute("seealso", loginUser.getSeealso());
		}
		else if(loginUser == null) {
			ra.addFlashAttribute("f", "?????????");
			return "redirect:/user/login";
		}
		return "redirect:/";
	}
	
	@PostMapping("/checkId")
	@ResponseBody
	public int checkId(@RequestParam("useremail") String useremail) {
	int cnt = services.checkId(useremail);
	return cnt;
	}
	
	@PostMapping("/message")
	@ResponseBody
	public String message(@RequestParam("userphone") String userphone) {
		String num = service.phone(userphone);
		log.info(num);
		return num;
	}
	@PostMapping("/pwChanges")
	public String pwChanges(String useremail, String userpw, RedirectAttributes ra, HttpServletRequest resq) {
		if(services.pwChanges(useremail,userpw)) {
			ra.addFlashAttribute("t","??????");
			HttpSession session = resq.getSession();
			session.removeAttribute("userpw");
			session.setAttribute("userpw", userpw);
		}
		else {
			ra.addFlashAttribute("f", "??????");
		}
		return "redirect:/";
	}
	
	@PostMapping("/nameCn")
	public String nameCn(String useremail, String username, RedirectAttributes ra, HttpServletRequest resq) {
		if(services.nameCn(useremail,username)) {
			ra.addFlashAttribute("T", "??????");
			HttpSession session = resq.getSession();
			session.removeAttribute("loginUsername");
			session.setAttribute("loginUsername", username);
		}
		else {
			ra.addFlashAttribute("F", "??????");
		}
		return "redirect:/";
	}
	
	@PostMapping("/zipCn")
	public String zipCn(UserDTO user, RedirectAttributes ra, HttpServletRequest resq) {
		if(services.zipCn(user)) {
			ra.addFlashAttribute("tT","tt");
			HttpSession session = resq.getSession();
			session.removeAttribute("postnum");
			session.removeAttribute("addr");
			session.removeAttribute("detailaddress");
			session.removeAttribute("seealso");
			session.setAttribute("postnum", user.getPostnum());
			session.setAttribute("addr", user.getAddr());
			session.setAttribute("detailaddress", user.getDetailaddress());
			session.setAttribute("seealso", user.getSeealso());
		}
		else {
			ra.addFlashAttribute("fF","ff");
		}
		return "redirect:/";
	}
	
	@PostMapping("/getPw")
	public String getPw(String useremail) {
		String userpw = services.getPw(useremail);
		return userpw;
	}
	
	@PostMapping("/bye")
	public String bye(String useremail, RedirectAttributes ra, HttpServletRequest resq) {
		if(services.bye(useremail)) {
			HttpSession session = resq.getSession();
			session.invalidate();
			ra.addFlashAttribute("byeSuc", "??????");
		}
		else {
			ra.addFlashAttribute("byeF", "??????");
		}
		return "redirect:/";
	}
	
	// Tiles body????????? ??????
    @RequestMapping(value="/myInfo")
    public String testPage() {
        return "/tiles/myInfo";
    }
    
    @RequestMapping(value="/pwchange")
    public String testPages() {
    	return "/tiles/pwchange";
    }
    
    @RequestMapping(value ="/bye")
    public String byePage() {
    	return "/tiles/bye";
    }
}


