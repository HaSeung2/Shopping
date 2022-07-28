package com.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.domain.Files;
import com.my.domain.ProductDTO;
import com.my.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService{
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	
	@Override
	public boolean addProduct(ProductDTO prod) {
		return mapper.setProduct(prod) == 1;
	}
	
	@Override
	public List<Files> getFile() {
		return mapper.getFile();
	}
	
	@Override
	public List<ProductDTO> getProduct() {
		return mapper.getProduct();
	}
	
	@Override
	public int getProductnum() {
		return mapper.getProductnum();
	}
	
	@Override
	public boolean setFile(String fileurl, String filerealname, String filename, int productnum, String safefile) {
		return mapper.setFile(fileurl, filerealname, filename, productnum, safefile );
	}
	
	@Override
	public String getFilename(int productnum) {
		return mapper.getFilename(productnum);
	}
	
	@Override
	public ProductDTO getproduct(int productnum) {
		return mapper.getproduct(productnum);
	}
}
