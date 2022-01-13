package com.mvc.fotsal.model.biz;

import java.util.List;
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
	public Map<String, Object> kakaoConnectionCheck(Map<String, Object> loginApi);
	public int setKakaoConnection(Map<String, Object> loginApi);
	public UserDto userKakaoLoginPro(Map<String, Object> loginApin);
	public List<UserDto> selectList();
	public UserDto aselectOne(String user_id);
}