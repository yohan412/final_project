package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.FaqBoardDto;
import com.mvc.fotsal.paging.FaqSearch;

public interface FaqBoardBiz {
	public List<FaqBoardDto> selectList(FaqSearch STLP);
	public int listCount(FaqSearch STLP);
	public FaqBoardDto selectOne(int faq_no);
	
	public int insert(FaqBoardDto dto);
	public int update(FaqBoardDto dto);
	public int delete(int faq_no);
}
