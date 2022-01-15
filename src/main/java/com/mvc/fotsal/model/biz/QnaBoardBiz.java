package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.QnaBoardDto;
import com.mvc.fotsal.paging.QnaSearch;


public interface QnaBoardBiz {

	public List<QnaBoardDto> selectList(QnaSearch STLP);
	public int listCount(QnaSearch STLP);
	
	public QnaBoardDto selectOne2(int qna_gpno);
	public QnaBoardDto selectOne(int qna_gpno);
	public int insert(QnaBoardDto dto);
	public int comment_insert(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public int delete(int qna_no);
}
