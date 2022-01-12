package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.ReviewDao;
import com.mvc.fotsal.model.dto.ReviewDto;
import com.mvc.fotsal.paging.ReviewPaging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReviewBizImpl implements ReviewBiz{
    @Autowired
    private ReviewDao reviewDao;

    @Override
    public List<ReviewDto> reviewlist(Map<String, Object> reviewmap) {
        return reviewDao.reviewlist(reviewmap);
    }

    @Override
    public int listcount(int stadium_no) {
        return reviewDao.listcount(stadium_no);
    }

    @Override
    public ReviewDto detail(int review_no) {
        return reviewDao.detail(review_no);
    }

    @Override
    public int insert(ReviewDto reviewDto) {
        return reviewDao.insert(reviewDto);
    }

    @Override
    public int update(ReviewDto reviewDto) {
        return reviewDao.update(reviewDto);
    }

    @Override
    public int delete(int review_no) {
        return reviewDao.delete(review_no);
    }
}
