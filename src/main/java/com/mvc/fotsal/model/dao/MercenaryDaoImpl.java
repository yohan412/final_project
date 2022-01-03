package com.mvc.fotsal.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.fotsal.model.dto.MercenaryDto;

@Repository
public class MercenaryDaoImpl implements MercenaryDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MercenaryDto selectOne(int user_no) {
		
		MercenaryDto detail = null;
		
		try {
			detail = sqlSession.selectOne(NAMESPACE+"selectOne",user_no);
		} catch (Exception e) {
			System.out.println("error: select one failed");
			e.printStackTrace();
		}
		
		
		return detail;
	}

	@Override
	public int insert(MercenaryDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			System.out.println("error: mercenary insert failed");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(MercenaryDto dto) {
		return 0;
	}

	@Override
	public int delete(int user_no) {
		return 0;
	}

	@Override
	public List<MercenaryDto> selectList() {
		
		return null;
	}
	
}
