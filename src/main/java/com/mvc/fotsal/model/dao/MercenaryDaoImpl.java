package com.mvc.fotsal.model.dao;

import java.util.ArrayList;
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
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("error: mercenary update failed");
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int delete(int user_no) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete",user_no);
		} catch (Exception e) {
			System.out.println("error: mercenary delete failed");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<MercenaryDto> selectList(MercenaryDto mDto) {
		List<MercenaryDto> list = new ArrayList<MercenaryDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", mDto);
		} catch (Exception e) {
			System.out.println("error: mercenary list failed");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<MercenaryDto> selectListT(MercenaryDto mDto) {
		List<MercenaryDto> list = new ArrayList<MercenaryDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectListT", mDto);
		} catch (Exception e) {
			System.out.println("error: mercenary T list failed");
			e.printStackTrace();
		}
		
		return list;
	}
	
}
