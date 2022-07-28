package com.my.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.domain.BuyProductDTO;
import com.my.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/buy/*")
@Log4j
public class BuyController {
	@Setter(onMethod_ = @Autowired)
	public UserService service;
	
	@PostMapping(value ="/buyProduct", consumes = "application/json")
	public ResponseEntity<String> buyProduct(@RequestBody BuyProductDTO buy){
		log.info(buy);
		boolean check = service.buyProduct(buy);
		String productname = buy.getProductname();
		log.info(productname);
		return check ? new ResponseEntity<String>(productname,HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
