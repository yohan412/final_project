package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.UserDto;

public interface UserBiz {
	public UserDto login(UserDto dto);
	public int insert(UserDto dto);
}
