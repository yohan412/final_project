package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;

public interface StadiumBiz {
    public UserDto selectuser(UserDto userDto);
    public int insert(StadiumDto stadiumDto);
}
