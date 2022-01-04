package com.mvc.fotsal.model.dao;

import java.util.List;

import com.mvc.fotsal.model.dto.MercenaryDto;

public interface MercenaryDao {
	String NAMESPACE = "mercenary_info.";
	
	public MercenaryDto selectOne(int user_no); // 용병지원서 자세히보기
	public int insert(MercenaryDto dto); // 용병지원서 작성
	public int update(MercenaryDto dto); // 용병지원서 수정
	public int delete(int user_no); // 용병지원서 삭제
	public List<MercenaryDto> selectList(MercenaryDto mDto);
}
