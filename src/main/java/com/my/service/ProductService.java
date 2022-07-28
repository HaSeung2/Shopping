package com.my.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.my.domain.Files;
import com.my.domain.ProductDTO;

@Service
public interface ProductService {
	boolean setFile(String fileurl, String filerealname, String filename, int productnum, String safefile);
	boolean addProduct(ProductDTO prod);
	List<ProductDTO> getProduct();
	List<Files> getFile();
	int getProductnum();
	String getFilename(int productnum);
	ProductDTO getproduct(int productnum);
}
