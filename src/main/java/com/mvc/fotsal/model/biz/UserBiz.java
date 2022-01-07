package com.mvc.fotsal.model.biz;

import java.util.HashMap;
import java.util.Map;

import com.mvc.fotsal.model.dto.UserDto;

public interface UserBiz {
	public UserDto login(UserDto dto);
	public int insert(UserDto dto);
	public int idChk(String user_id);
	public UserDto findId(UserDto dto);
	public int changePw(UserDto dto);
	public int changePwInput(UserDto dto);
	public UserDto selectOne(String user_id);
	public int update(UserDto dto);
	public int delete(String user_id);
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson);
	public int setNaverConnection(Map<String, Object> apiJson);
	public UserDto userNaverLoginPro(Map<String, Object> apiJson);
	public HashMap<String, Object> kakaoConnectionCheck(HashMap<String, Object> loginApi);
	public int setKakaoConnection(HashMap<String, Object> loginApi);
	public UserDto userKakaoLoginPro(HashMap<String, Object> loginApin);
}