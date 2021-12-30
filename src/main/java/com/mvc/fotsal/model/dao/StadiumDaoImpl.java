package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.StadiumPaging;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StadiumDaoImpl implements StadiumDao{
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public UserDto selectuser(UserDto userDto){
        UserDto res = null;

        try{
            res = sqlSessionTemplate.selectOne(NAMESPACE + "user", userDto);
        }catch (Exception e){
            System.out.println("[ERROR]: selectuser");
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int insert(StadiumDto stadiumDto) {
        int res = 0;

        try {
            res = sqlSessionTemplate.insert(NAMESPACE + "insert", stadiumDto);
        }catch (Exception e){
            System.out.println("[ERROR]: insert");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public List<StadiumDto> list(StadiumPaging stadiumPaging) {
        List<StadiumDto> res = new ArrayList<StadiumDto>();

        try{
            res = sqlSessionTemplate.selectList(NAMESPACE + "stadiumlist", stadiumPaging);
        }catch (Exception e){
            System.out.println("[ERROR]: StadiumList");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int listCount() {
        int res = 0;

        try{
            res = sqlSessionTemplate.selectOne(NAMESPACE + "listCount");
        }catch (Exception e){
            System.out.println("[ERROR]: listCount");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public StadiumDto detail(int stadium_no) {
        StadiumDto res = null;

        try{
            res = sqlSessionTemplate.selectOne(NAMESPACE + "stadiumdetail", stadium_no);
        }catch (Exception e){
            System.out.println("[ERROR]: StadiumDetail");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int update(StadiumDto stadiumDto) {
        int res = 0;

        try{
            res = sqlSessionTemplate.update(NAMESPACE + "stadiumupdate", stadiumDto);
        }catch (Exception e){
            System.out.println("[ERROR]: StadiumUpdate");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int delete(int stadium_no) {
        int res = 0;

        try{
            res = sqlSessionTemplate.delete(NAMESPACE + "stadiumdelete", stadium_no);
        }catch (Exception e){
            System.out.println("[ERROR]: StadiumDelete");
            e.printStackTrace();
        }
        return res;
    }

}
