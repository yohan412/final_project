package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.StadiumPaging;
import com.mvc.fotsal.paging.StadiumSearch;

import java.util.List;

public interface StadiumBiz {
    public UserDto selectuser(UserDto userDto);
    public int insert(StadiumDto stadiumDto);
    public List<StadiumDto> list(StadiumSearch stadiumSearch);
    public int listCount(StadiumSearch stadiumSearch);
    public StadiumDto detail(int stadium_no);
    public int update(StadiumDto stadiumDto);
    public int delete(int stadium_no);
}
