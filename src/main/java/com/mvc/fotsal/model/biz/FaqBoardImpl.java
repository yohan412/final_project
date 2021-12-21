package com.mvc.fotsal.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.fotsal.model.dao.FaqBoardDao;
import com.mvc.fotsal.model.dto.FaqBoardDto;

@Service
public class FaqBoardImpl implements FaqBoardBiz{

	@Autowired
	private FaqBoardDao dao;
	
	@Override
	public List<FaqBoardDto> selectList() {
		return dao.selectList();
	}

	@Override
	public FaqBoardDto selectOne(int faq_no) {
		return null;
	}

}
