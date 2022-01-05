package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.StadiumDao;
import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.StadiumPaging;
import com.mvc.fotsal.paging.StadiumSearch;
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
    public List<StadiumDto> list(StadiumSearch stadiumSearch) {
        return stadiumDao.list(stadiumSearch);
    }

    @Override
    public int listCount(StadiumSearch stadiumSearch) {
        return stadiumDao.listCount(stadiumSearch);
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

    @Override
    public int FindNo(StadiumDto stadiumDto) {
        return stadiumDao.FindNo(stadiumDto);
    }

    @Override
    public int insert_img(PicDto picDto) {
        return stadiumDao.insert_img(picDto);
    }

    @Override
    public List<PicDto> IMG_list() {
        return stadiumDao.IMG_list();
    }


}
