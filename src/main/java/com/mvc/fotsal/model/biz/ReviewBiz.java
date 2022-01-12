package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.ReviewDto;
import com.mvc.fotsal.paging.ReviewPaging;

import java.util.List;
import java.util.Map;

public interface ReviewBiz {
    public List<ReviewDto> reviewlist(Map<String, Object> reviewmap);
    public int listcount(int stadium_no);
    public ReviewDto detail(int review_no);
    public int insert(ReviewDto reviewDto);
    public int update(ReviewDto reviewDto);
    public int delete(int review_no);
}
