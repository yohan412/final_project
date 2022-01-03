package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.UserDto;

public interface UserBiz {
	public UserDto login(UserDto dto);
	public int insert(UserDto dto);
	public int idChk(String user_id);
	public UserDto findId(UserDto dto);
	public int changePw(UserDto dto);
	public int changePwInput(UserDto dto);
	public UserDto selectOne(String user_id);
	public int update(UserDto dto);
	public int delete(String user_id);
	
}