package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.StadiumDao;
import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StadiumBizImpl implements StadiumBiz{
    @Autowired
    private StadiumDao stadiumDao;

    @Override
    public UserDto selectuser(UserDto userDto){
        return stadiumDao.selectuser(userDto);
    }

    @Override
    public int insert(StadiumDto stadiumDto) {
        return stadiumDao.insert(stadiumDto);
    }

}
