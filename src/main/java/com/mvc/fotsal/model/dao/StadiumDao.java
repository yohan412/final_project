package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;

public interface StadiumDao {
    String NAMESPACE = "StadiumBoard.";

    public UserDto selectuser(UserDto userDto);
    public int insert(StadiumDto stadiumDto);
}
