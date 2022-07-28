package com.my.service;

import com.my.domain.BuyProductDTO;
import com.my.domain.UserDTO;

public interface UserService {
	int checkId(String useremail);
	boolean join(UserDTO user);
	UserDTO login(String useremail, String userpw);
	UserDTO getUser(String useremail);
	boolean pwChanges(String useremail, String userpw);
	String getPw(String useremail);
	boolean nameCn(String useremail, String username);
	boolean zipCn(UserDTO user);
	boolean buyProduct(BuyProductDTO buy);
}
