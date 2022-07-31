package com.my.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.my.domain.BuyProductDTO;
import com.my.domain.ReviewDTO;
import com.my.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/buy/*")
@Log4j
public class BuyController {
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	@PostMapping(value ="/buyProduct", consumes = "application/json")
	public ResponseEntity<String> buyProduct(@RequestBody BuyProductDTO buy){
		boolean check = service.buyProduct(buy);
		String productname = buy.getProductname();
		return check ? new ResponseEntity<String>(productname,HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value ="/review", consumes = "application/json")
	public ResponseEntity<String> review(@RequestBody ReviewDTO review){
		return service.review(review) ? new ResponseEntity<String>(service.getReviewnum()+"",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value="/reviewDelete", consumes = "application/json")
	public ResponseEntity<String> reviewDelete(@RequestBody int reviewnum){
		return service.reviewDelete(reviewnum) ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/{reviewnum}", consumes = "application/json")
	public ResponseEntity<String> reviewModify(@RequestBody ReviewDTO review){
		return service.reviewModify(review) ? new ResponseEntity<String>("success",HttpStatus.OK):new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}








