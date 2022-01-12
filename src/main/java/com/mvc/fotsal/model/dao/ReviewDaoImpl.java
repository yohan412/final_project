package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.ReviewDto;
import com.mvc.fotsal.paging.ReviewPaging;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewDaoImpl implements ReviewDao{
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<ReviewDto> reviewlist(Map<String, Object> reviewmap) {
        List<ReviewDto> res = new ArrayList<ReviewDto>();

        try {
            res = sqlSessionTemplate.selectList(NAMESPACE + "reviewlist", reviewmap);
        }catch (Exception e){
            System.out.println("[ERROR]: ReviewList");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int listcount(int stadium_no) {
        int res = 0;

        try{
            res = sqlSessionTemplate.selectOne(NAMESPACE + "listcount", stadium_no);
        }catch (Exception e){
            System.out.println("[ERROR]: listcount");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public ReviewDto detail(int review_no) {
        ReviewDto res = null;

        try {
            res = sqlSessionTemplate.selectOne(NAMESPACE + "reviewdetail", review_no);
        }catch (Exception e){
            System.out.println("[ERROR]: ReviewDetail");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int insert(ReviewDto reviewDto) {
        int res = 0;

        try{
            res = sqlSessionTemplate.insert(NAMESPACE + "reviewinsert", reviewDto);
        }catch (Exception e){
            System.out.println("[ERROR]: ReviewInsert");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int update(ReviewDto reviewDto) {
        int res = 0;

        try{
            res = sqlSessionTemplate.update(NAMESPACE + "reviewupdate", reviewDto);
        }catch (Exception e){
            System.out.println("[ERROR]: ReviewUpdate");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int delete(int review_no) {
        int res = 0;

        try{
            res = sqlSessionTemplate.delete(NAMESPACE + "reviewdelete", review_no);
        }catch (Exception e){
            System.out.println("[ERROR]: ReviewDelete");
            e.printStackTrace();
        }

        return res;
    }
}
