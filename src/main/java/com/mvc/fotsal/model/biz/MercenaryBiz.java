package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.MercenaryDto;

public interface MercenaryBiz {
	
	public MercenaryDto selectOne(int user_no);
	
	public int insert(MercenaryDto dto);
	
	public int update(MercenaryDto dto);
	
	public int delete(int user_no);

	public List<MercenaryDto> selectList();
	
	
	
}
