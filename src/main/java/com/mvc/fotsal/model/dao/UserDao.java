package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.UserDto;

public interface UserDao {
	String NAMESPACE = "userinfo";
	
	public UserDto login(UserDto dto);
}
