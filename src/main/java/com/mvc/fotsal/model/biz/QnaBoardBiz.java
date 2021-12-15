package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.QnaBoardDto;

public interface QnaBoardBiz {
	public List<QnaBoardDto> selectList();
	public QnaBoardDto selectOne(int qna_no);
	public int insert(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public int delete(int qna_no);
}
