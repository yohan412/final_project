package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.ReviewDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ReviewDaoImpl implements ReviewDao{
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<ReviewDto> reviewlist() {
        List<ReviewDto> res = new ArrayList<ReviewDto>();

        try {
            res = sqlSessionTemplate.
        }catch (Exception e){
            System.out.println("[ERROR]: ReviewList");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int listcount() {
        return 0;
    }
}
