package com.my.domain;

import lombok.Data;

@Data
public class BuyProductDTO {
	private String useremail;
	private String username;;
	private int productnum;
    private String productname;
    private int postnum;
    private String addr;
    private String detailaddress;
    private String seealso;
}
