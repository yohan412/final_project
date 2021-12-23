package com.mvc.fotsal.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.fotsal.model.dto.FaqBoardDto;

@Repository
public class FaqBoardDaoImpl implements FaqBoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FaqBoardDto> selectList() {
		List<FaqBoardDto> faqlist = new ArrayList<FaqBoardDto>();
		
		try {
			faqlist = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error] : select list");
			e.printStackTrace();
		}
		return faqlist;
	}

	@Override
	public FaqBoardDto selectOne(int faq_no) {
		return null;
	}

}
