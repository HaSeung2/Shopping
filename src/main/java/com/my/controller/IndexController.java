package com.my.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.domain.Files;
import com.my.domain.ProductDTO;
import com.my.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class IndexController {
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goIndex(Model model) {
	model.addAttribute("product",service.getProduct());
	model.addAttribute("file", service.getFile());
	model.addAttribute("maxnum", service.getProductnum());
	
	return "home";
	}
}
