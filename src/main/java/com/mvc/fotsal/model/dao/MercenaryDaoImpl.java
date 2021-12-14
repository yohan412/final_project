package com.mvc.fotsal.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.fotsal.model.dto.mercenaryDto;

@Repository
public class MercenaryDaoImpl implements MercenaryDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public mercenaryDto mercenaryDetail(mercenaryDto dto) {
		
		return null;
	}
	
}
