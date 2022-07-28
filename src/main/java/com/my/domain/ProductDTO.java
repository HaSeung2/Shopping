package com.my.domain;


import lombok.Data;

@Data
public class ProductDTO {
	private int productnum;
    private String productname;
    private String productprice;
    private String productcontents;
	private String useremail;
}
