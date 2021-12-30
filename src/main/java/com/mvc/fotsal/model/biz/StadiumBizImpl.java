package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.StadiumDao;
import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.StadiumPaging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<StadiumDto> list(StadiumPaging stadiumPaging) {
        return stadiumDao.list(stadiumPaging);
    }

    @Override
    public int listCount() {
        return stadiumDao.listCount();
    }

    @Override
    public StadiumDto detail(int stadium_no) {
        return stadiumDao.detail(stadium_no);
    }

    @Override
    public int update(StadiumDto stadiumDto) {
        return stadiumDao.update(stadiumDto);
    }

    @Override
    public int delete(int stadium_no) {
        return stadiumDao.delete(stadium_no);
    }


}
