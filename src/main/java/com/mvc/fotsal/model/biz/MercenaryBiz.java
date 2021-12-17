package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.MercenaryDto;

public interface MercenaryBiz {
	
	public MercenaryDto mercenaryDetail(MercenaryDto dto);
	public int insert(MercenaryDto dto);
	public int update(MercenaryDto dto);
	public int delete(int user_no);
	
	
	
}
