package com.mvc.fotsal.model.dao;

import java.util.List;

import com.mvc.fotsal.model.dto.QnaBoardDto;
import com.mvc.fotsal.paging.QnaSearch;

public interface QnaBoardDao {
	String NAMESPACE = "qnainfo.";
	

	public QnaBoardDto selectOne(int qna_no); // 자세히보기
	public int insert(QnaBoardDto dto); // 등록
	public int update(QnaBoardDto dto); // 수정
	public int delete(int qna_no); // 삭제
	public List<QnaBoardDto> selectList(QnaSearch STLP); // 리스트 및 페이징
	public int listCount(QnaSearch STLP); // 총 갯수
}
