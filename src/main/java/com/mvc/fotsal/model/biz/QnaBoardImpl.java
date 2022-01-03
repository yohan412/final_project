package com.mvc.fotsal.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.fotsal.model.dao.QnaBoardDao;
import com.mvc.fotsal.model.dto.QnaBoardDto;
import com.mvc.fotsal.paging.QnaSearch;


@Service
public class QnaBoardImpl implements QnaBoardBiz{

	@Autowired
	private QnaBoardDao dao;
	
	@Override
	public List<QnaBoardDto> selectList(QnaSearch STLP) {
		return dao.selectList(STLP);
	}
	
	@Override
	public int listCount(QnaSearch STLP) {
		return dao.listCount(STLP);
	}

	@Override
	public QnaBoardDto selectOne(int qna_no) {
		return dao.selectOne(qna_no);
	}

	@Override
	public int insert(QnaBoardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(QnaBoardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int qna_no) {
		return dao.delete(qna_no);
	}



}
