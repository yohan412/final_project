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

		@Override
		public int changePw(UserDto dto) {
			int res=0;
			
			try {
				res=sqlSession.selectOne(NAMESPACE+"changepw",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public int changePwInput(UserDto dto) {
			int res=0;
			
			try {
				res=sqlSession.update(NAMESPACE+"changepwinput",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public UserDto selectOne(String user_id) {
			UserDto dto = null;
			
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectOne", user_id);
			} catch (Exception e) {
				System.out.println("[error]: select One");
				e.printStackTrace();
			}
			
			return dto;
		}

		@Override
		public int userUpdate(UserDto dto) {
			int res = 0;
			
			try {
				res = sqlSession.update(NAMESPACE+"userUpdate", dto);
			} catch (Exception e) {
				System.out.println("[error]: userUpdate");
				e.printStackTrace();
			}
			
			return res;
		}

		
}