package com.mvc.fotsal.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.fotsal.model.dto.QnaBoardDto;

@Repository
public class QnaBoardDaoImpl implements QnaBoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnaBoardDto> selectList() {
		List<QnaBoardDto> list = new ArrayList<QnaBoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error] : select list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public QnaBoardDto selectOne(int qna_no) {
		return null;
	}

	@Override
	public int insert(QnaBoardDto dto) {
		return 0;
	}

	@Override
	public int update(QnaBoardDto dto) {
		return 0;
	}

	@Override
	public int delete(int qna_no) {
		return 0;
	}
	
}
