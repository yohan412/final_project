package com.mvc.fotsal.model.dao;

import java.util.List;

import com.mvc.fotsal.model.dto.FaqBoardDto;
import com.mvc.fotsal.paging.FaqSearch;

public interface FaqBoardDao {
	String NAMESPACE = "faqinfo.";
	
	public List<FaqBoardDto> selectList(FaqSearch STLP);
	public FaqBoardDto selectOne(int faq_no);
	public int insert(FaqBoardDto dto);
	public int listCount(FaqSearch STLP);
	
}
