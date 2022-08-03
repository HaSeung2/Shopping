package com.my.domain;

import lombok.Data;

@Data
public class ReviewDTO {
	private int reviewnum;
	private String useremail;
	private String username;
	private int productnum;
	private String reviewcontents;
	private String regdate;
}
