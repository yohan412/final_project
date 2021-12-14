package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.UserDto;

public interface UserDao {
	String NAMESPACE = "userinfo.";
	
	
	//·Î±×ÀÎ
	public UserDto login(UserDto dto);
}
