package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.UserDto;

public interface StadiumDao {
    String NAMESPACE = "StadiumBoard.";

    public UserDto selectuser(UserDto userDto);
}
