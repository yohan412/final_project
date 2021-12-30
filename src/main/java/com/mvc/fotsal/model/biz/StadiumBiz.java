package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.StadiumPaging;

import java.util.List;

public interface StadiumBiz {
    public UserDto selectuser(UserDto userDto);
    public int insert(StadiumDto stadiumDto);
    public List<StadiumDto> list(StadiumPaging stadiumPaging);
    public int listCount();
    public StadiumDto detail(int stadium_no);
    public int update(StadiumDto stadiumDto);
    public int delete(int stadium_no);
}
