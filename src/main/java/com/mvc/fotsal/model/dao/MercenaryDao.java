package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.MercenaryDto;

public interface MercenaryDao {
	String NAMESPACE = "mercenary_info.";
	
	public MercenaryDto mercenaryDetail(MercenaryDto dto);
}
