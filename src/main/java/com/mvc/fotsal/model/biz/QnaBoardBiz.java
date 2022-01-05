package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.QnaBoardDto;
import com.mvc.fotsal.paging.QnaSearch;


public interface QnaBoardBiz {

	public List<QnaBoardDto> selectList(QnaSearch STLP);
	public int listCount(QnaSearch STLP);
	
	public QnaBoardDto selectOne(int qna_no);
	public int insert(QnaBoardDto dto);
	public int rp_insert(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public int delete(int qna_no);
	public int comment_delete(int qna_gpsq);
}
