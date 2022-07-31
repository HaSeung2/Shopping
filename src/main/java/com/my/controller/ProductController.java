package com.my.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.domain.ProductDTO;
import com.my.domain.ReviewDTO;
import com.my.service.ProductService;
import com.my.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
public class ProductController {
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	
	@GetMapping("/addproduct")
	public void addproduct() {
	}
	
	@PostMapping("/addproducte")
	public String addpro(ProductDTO prod, RedirectAttributes ra) {
		if(service.addProduct(prod)) {
			ra.addFlashAttribute("suc", "성공");
		}
		return "redirect:/product/addproduct";
	}
	
	@PostMapping("/uploadFile")
	public  String insertinto(MultipartFile [] files, String productname, String productcontents, String productprice, String useremail,RedirectAttributes ra, HttpServletRequest request)throws IOException {
		log.info(files);
		ProductDTO prod = new ProductDTO();
		prod.setProductname(productname);
		prod.setProductcontents(productcontents);
		prod.setProductprice(productprice);
		prod.setUseremail(useremail);
		service.addProduct(prod);
		
		
        String fileurl = "D:\\1900_WEB_LHS\\my\\workspace\\Shopping\\src\\main\\webapp\\resources\\img\\";
        log.info(fileurl);
        for (MultipartFile mf : files) {
            String filerealname = mf.getOriginalFilename(); // 원본 파일 명
            long filesSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + filerealname);
            System.out.println("filesSize : " + filesSize);
            
            UUID uuid = UUID.randomUUID();
            
            String filename = uuid+filerealname;
            String safefile = fileurl+uuid+filerealname;
            try {
            	int productnum = service.getProductnum();
            	System.out.println(productnum);
            	if(service.setFile(fileurl, filerealname, filename, productnum,safefile)) {
            		mf.transferTo(new File(safefile));
            	}
            	else {
            		ra.addFlashAttribute("f", "실패");
            	}
                
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/";
}
	@GetMapping("/board")
	public void goboard(ProductDTO productnum, Model model) {
		String filename = service.getFilename(productnum.getProductnum());
		ProductDTO prod = service.getproduct(productnum.getProductnum());
		List<ReviewDTO> review = service.getReview(productnum.getProductnum());
		model.addAttribute("filename", filename);
		model.addAttribute("product", prod);
		model.addAttribute("review", review);
	}
}















