package com.my.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.domain.BuyProductDTO;
import com.my.domain.UserDTO;
import com.my.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService{
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public int checkId(String useremail) {
		return mapper.checkId(useremail);
	}
	
	@Override
	public boolean join(UserDTO user) {
		return mapper.join(user) == 1;
	}
	@Override
	public UserDTO login(String useremail, String userpw) {
		return mapper.login(useremail,userpw);
	}
	
	@Override
	public UserDTO getUser(String useremail) {
		return mapper.getUser(useremail);
	}
	
	@Override
	public boolean pwChanges(String useremail, String userpw) {
		return mapper.pwChanges(useremail, userpw) == 1;
	}
	
	@Override
	public String getPw(String useremail) {
		return mapper.getPw(useremail);
	}
	
	@Override
	public boolean nameCn(String useremail, String username) {
		return mapper.nameCn(useremail,username) == 1;
	}
	
	@Override
	public boolean zipCn(UserDTO user) {
		return mapper.zipCn(user) == 1;
	}

	@Override
	public boolean buyProduct(BuyProductDTO buy) {
		return mapper.buyProduct(buy) == 1;
	}
}
