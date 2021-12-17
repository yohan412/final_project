package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.MercenaryDto;

public interface MercenaryDao {
	String NAMESPACE = "mercenary_info.";
	
	public MercenaryDto mercenaryDetail(MercenaryDto dto); // 용병지원서 자세히보기
	public int insert(MercenaryDto dto);
	public int update(MercenaryDto dto);
	public int delete(int user_no);
}
