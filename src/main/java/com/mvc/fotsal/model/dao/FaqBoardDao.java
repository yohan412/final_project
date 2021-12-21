package com.mvc.fotsal.model.dao;

import java.util.List;

import com.mvc.fotsal.model.dto.FaqBoardDto;


public interface FaqBoardDao {
	String NAMESPACE = "faqInfo.";
	
	public List<FaqBoardDto> selectList();
	public FaqBoardDto selectOne(int faq_no);
}
