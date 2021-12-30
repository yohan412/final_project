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
		List<QnaBoardDto> qnalist = new ArrayList<QnaBoardDto>();
		
		try {
			qnalist = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error] : select list");
			e.printStackTrace();
		}
		
		return qnalist;
	}

	@Override
	public QnaBoardDto selectOne(int qna_no) {
		QnaBoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", qna_no);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public int insert(QnaBoardDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(QnaBoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
				
		return res;
	}

	@Override
	public int delete(int qna_no) {
		return 0;
	}
	
}
