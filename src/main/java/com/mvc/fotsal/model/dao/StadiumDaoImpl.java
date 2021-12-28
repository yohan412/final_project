package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
