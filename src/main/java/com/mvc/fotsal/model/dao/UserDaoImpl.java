package com.mvc.fotsal.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		public int update(UserDto dto) {
			int res = 0;
			
			try {
				res = sqlSession.update(NAMESPACE+"update", dto);
			} catch (Exception e) {
				System.out.println("[error]: Update");
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public int delete(String user_id) {
			int res = 0;
			
			try {
				res = sqlSession.delete(NAMESPACE+"delete", user_id);
			} catch (Exception e) {
				System.out.println("[error]: delete");
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) {
			
			Map<String, Object> res = null;
			
			try {
				res=sqlSession.selectOne(NAMESPACE+"conchk", apiJson);
			} catch (Exception e) {
				System.out.println("[error]: conchk");
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public int setNaverConnection(Map<String, Object> apiJson) {
			
			int res =0;
			
			try {
				res=sqlSession.update(NAMESPACE+"naverlogset",apiJson);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public UserDto userNaverLoginPro(Map<String, Object> apiJson) {
			
			UserDto res =null;
			
			try {
				res=sqlSession.selectOne(NAMESPACE+"naverlogin",apiJson);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}

		@Override
		public HashMap<String, Object> kakaoConnectionCheck(Map<String, Object> loginApi) {
			
			HashMap<String, Object> res = null;
			
			try {
				res=sqlSession.selectOne(NAMESPACE+"kconchk", loginApi);
			} catch (Exception e) {
				System.out.println("[error]: kconchk");
				e.printStackTrace();
			}
			
			return res;
		}

		@Override
		public int setKakaoConnection(Map<String, Object> loginApi) {
			
			int res =0;
			
			try {
				res=sqlSession.update(NAMESPACE+"kakaologset", loginApi);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
			
		}

		@Override
		public UserDto userKakaoLoginPro(Map<String, Object> loginApi) {

			UserDto res =null;	
			
			try {
				res=sqlSession.selectOne(NAMESPACE+"kakaologin", loginApi);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}

		@Override
		public List<UserDto> selectList() {
			List<UserDto> list = new ArrayList<UserDto>();
			
			try {
				list = sqlSession.selectList(NAMESPACE+"selectList");
			} catch (Exception e) {
				System.out.println("[error]: select list" );
				e.printStackTrace();
			}
			return list;
		}

		@Override
		public UserDto aselectOne(String user_id) {
			UserDto dto = null;
			
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectOne", user_id);
			} catch (Exception e) {
				System.out.println("[error]: aselect one");
				e.printStackTrace();
			}
			return dto;
		}
		
		@Override
		public UserDto BselectOne(String user_id) {
			UserDto dto = null;
			
			try {
				dto = sqlSession.selectOne(NAMESPACE+"selectOne", user_id);
			} catch (Exception e) {
				System.out.println("[error]: Bselect one");
				e.printStackTrace();
			}
			return dto;
		}
		
		@Override
		public int Bupdate(UserDto dto) {
			int res = 0;
			
			try {
				res = sqlSession.update(NAMESPACE+"Bupdate", dto);
			} catch (Exception e) {
				System.out.println("[error]: Bupdate");
				e.printStackTrace();
			}
			
			return res;
		}
		
		@Override
		public int Bdelete(String user_id) {
			int res = 0;
			
			try {
				res = sqlSession.delete(NAMESPACE+"delete", user_id);
			} catch (Exception e) {
				System.out.println("[error]: Bdelete");
				e.printStackTrace();
			}
			
			return res;
		}
		
}