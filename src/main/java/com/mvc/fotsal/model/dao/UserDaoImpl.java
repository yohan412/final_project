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
	
		@Override
		public int insert(UserDto dto) {
			int res = 0;
			
			try {
				res = sqlSession.insert(NAMESPACE+"insert", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public int idChk(String user_id) {
			int res=0;
			
			try {
				res = sqlSession.selectOne(NAMESPACE+"idchk",user_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}

		@Override
		public UserDto findId(UserDto dto) {
			UserDto res = null;
			
			try {
				res=sqlSession.selectOne(NAMESPACE+"findid",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
		}
		
		
}