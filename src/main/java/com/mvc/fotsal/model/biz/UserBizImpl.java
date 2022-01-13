package com.mvc.fotsal.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.fotsal.model.dao.UserDao;
import com.mvc.fotsal.model.dto.UserDto;

@Service
public class UserBizImpl implements UserBiz {

	@Autowired
	private UserDao dao;
	
	@Override
	public UserDto login(UserDto dto) {
		
		return dao.login(dto);
	}

	@Override
	public int insert(UserDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int idChk(String user_id) {
		return dao.idChk(user_id);
	}

	@Override
	public UserDto findId(UserDto dto) {
		return dao.findId(dto);
	}

	@Override
	public int changePw(UserDto dto) {
		return dao.changePw(dto);
	}

	@Override
	public int changePwInput(UserDto dto) {
		return dao.changePwInput(dto);
	}

	@Override
	public UserDto selectOne(String user_id) {
		return dao.selectOne(user_id);
	}

	@Override
	public int update(UserDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(String user_id) {
		return dao.delete(user_id);
	}

	@Override
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) {
		return dao.naverConnectionCheck(apiJson);
	}

	@Override
	public int setNaverConnection(Map<String, Object> apiJson) {
		return dao.setNaverConnection(apiJson);
	}

	@Override
	public UserDto userNaverLoginPro(Map<String, Object> apiJson) {
		return dao.userNaverLoginPro(apiJson);
	}

	@Override
	public Map<String, Object> kakaoConnectionCheck(Map<String, Object> loginApi) {
		return dao.kakaoConnectionCheck(loginApi);
	}

	@Override
	public int setKakaoConnection(Map<String, Object> loginApi) {
		return dao.setKakaoConnection(loginApi);
	}

	@Override
	public UserDto userKakaoLoginPro(Map<String, Object> loginApin) {
		return dao.userKakaoLoginPro(loginApin);
	}

	@Override
	public List<UserDto> selectList() {
		return dao.selectList();
	}

	@Override
	public UserDto aselectOne(String user_id) {
		return dao.aselectOne(user_id);
	}
	
	
	
	
}
