package com.mvc.fotsal.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.fotsal.model.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public UserDto login(UserDto dto) {
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}