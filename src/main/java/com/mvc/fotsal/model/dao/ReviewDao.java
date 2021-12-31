package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.ReviewDto;

import java.util.List;

public interface ReviewDao {
    String NAMESPACE = "ReviewBoard.";

    public List<ReviewDto> reviewlist();
    public int listcount();
}
