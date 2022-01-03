package com.mvc.fotsal.model.dao;

import java.util.List;

import com.mvc.fotsal.model.dto.QnaBoardDto;
import com.mvc.fotsal.model.dto.TeamDto;
import com.mvc.fotsal.paging.QnaSearch;
import com.mvc.fotsal.paging.TeamSearch;

public interface QnaBoardDao {
	String NAMESPACE = "qnainfo.";
	

	public QnaBoardDto selectOne(int qna_no);
	public int insert(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public int delete(int qna_no);
	public List<QnaBoardDto> selectList(QnaSearch STLP);
	public int listCount(QnaSearch STLP); 
}
