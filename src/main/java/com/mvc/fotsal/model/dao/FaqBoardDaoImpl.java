package com.mvc.fotsal.model.dao;

import java.util.ArrayList;
import java.util.List;

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
		FaqBoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", faq_no);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(FaqBoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}
	

}
