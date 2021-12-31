package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.ReviewDao;
import com.mvc.fotsal.model.dto.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewBizImpl implements ReviewBiz{
    @Autowired
    private ReviewDao reviewDao;

    @Override
    public List<ReviewDto> reviewlist() {
        return reviewDao.reviewlist();
    }

    @Override
    public int listcount() {
        return reviewDao.listcount();
    }
}
