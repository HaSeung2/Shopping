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
	
	@PostMapping("/uploadFile")
	public  String insertinto(MultipartFile [] files, String productname, String productcontents, String productprice, String useremail,RedirectAttributes ra, HttpServletRequest request)throws IOException {
		log.info(files);
		ProductDTO prod = new ProductDTO();
		//상품 정보들을 먼저 테이블에 저장시켜 준다.
		prod.setProductname(productname);
		prod.setProductcontents(productcontents);
		prod.setProductprice(productprice);
		prod.setUseremail(useremail);
		service.addProduct(prod);
		
		
        String fileurl = "D:\\1900_WEB_LHS\\my\\workspace\\Shopping\\src\\main\\webapp\\resources\\img\\";
        for (MultipartFile mf : files) {
        	//사용자가 업로드한 파일이 있다면 아래 로직 수행
            String filerealname = mf.getOriginalFilename(); // 원본 파일 명
            long filesSize = mf.getSize(); // 파일 사이즈

            
            //저장할 때 파일 이름이 겹치지 않도록 랜덤 id를 부여한다.
            UUID uuid = UUID.randomUUID();
            
            String filename = uuid+filerealname;
            String safefile = fileurl+uuid+filerealname;
            try {
            	//같이 넘어온 상품의 상품 번호를 가져온다.
            	int productnum = service.getProductnum();
            	//이미지 파일을 db에 저장시키는 것에 성공 하면
            	if(service.setFile(fileurl, filerealname, filename, productnum,safefile)) {
            		//지정해둔 경로에 이미지를 업로드시킨 후 메인 화면으로 보낸다.
            		mf.transferTo(new File(safefile));
            		ra.addFlashAttribute("suc","tt");
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
		//board.jsp로 넘겨줄 데이터
		model.addAttribute("filename", filename);
		model.addAttribute("product", prod);
		model.addAttribute("review", review);
	}
}















