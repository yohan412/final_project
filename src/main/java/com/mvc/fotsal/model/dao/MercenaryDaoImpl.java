package com.mvc.fotsal.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.fotsal.model.dto.MercenaryDto;

@Repository
public class MercenaryDaoImpl implements MercenaryDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MercenaryDto mercenaryDetail(MercenaryDto dto) {
		
		return null;
	}
	
}
