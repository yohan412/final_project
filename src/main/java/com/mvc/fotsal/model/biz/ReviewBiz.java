package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.ReviewDto;

import java.util.List;

public interface ReviewBiz {
    public List<ReviewDto> reviewlist();
    public int listcount();
}
