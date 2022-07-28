package com.my.mapper;

import org.apache.ibatis.annotations.Param;

import com.my.domain.BuyProductDTO;
import com.my.domain.UserDTO;

public interface UserMapper {
	int checkId(String useremail);
	int join(UserDTO user);
	UserDTO login(@Param("useremail")String useremail, @Param("userpw")String userpw);
	UserDTO getUser(String useremail);
	int pwChanges(@Param("useremail")String useremail, @Param("userpw")String userpw);
	String getPw(String useremail);
	int nameCn(@Param("useremail")String useremail, @Param("username")String username);
	int zipCn(UserDTO user);
	int buyProduct(BuyProductDTO buy);
}
