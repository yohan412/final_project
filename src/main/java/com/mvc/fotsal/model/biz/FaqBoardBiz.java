package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.FaqBoardDto;

public interface FaqBoardBiz {
	public List<FaqBoardDto> selectList();
	public FaqBoardDto selectOne(int faq_no);
}
