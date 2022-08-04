package com.my.service;


import com.my.domain.BuyProductDTO;
import com.my.domain.ReviewDTO;
import com.my.domain.UserDTO;

public interface UserService {
	boolean reviewDelete(int reviewnum);
	int checkId(String useremail);
	boolean join(UserDTO user);
	UserDTO login(String useremail, String userpw);
	UserDTO getUser(String useremail);
	boolean pwChanges(String useremail, String userpw);
	String getPw(String useremail);
	boolean nameCn(String useremail, String username);
	boolean zipCn(UserDTO user);
	boolean buyProduct(BuyProductDTO buy);
	boolean review(ReviewDTO review);
	int getReviewnum();
	boolean reviewModify(ReviewDTO review);
	boolean bye(String useremail);
}
