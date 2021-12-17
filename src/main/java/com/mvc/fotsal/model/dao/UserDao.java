package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.UserDto;

public interface UserDao {
	String NAMESPACE = "userinfo.";
	
	
	public UserDto login(UserDto dto);
	public int insert(UserDto dto);
	public int idChk(String myid);
}
