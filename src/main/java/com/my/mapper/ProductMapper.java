package com.my.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.domain.Files;
import com.my.domain.ProductDTO;
import com.my.domain.ReviewDTO;

public interface ProductMapper {
	int setProduct(ProductDTO prod);
	List<ProductDTO> getProduct();
	List<Files> getFile();
	int getProductnum();
	boolean setFile(@Param("fileurl")String fileurl, @Param("filerealname")String filerealname, @Param("filename")String filename, @Param("productnum")int productnum, @Param("safefile")String safefile);
	String getFilename(int productnum);
	ProductDTO getproduct(int productnum);
	List<ReviewDTO> getReview(int productnum);
}
