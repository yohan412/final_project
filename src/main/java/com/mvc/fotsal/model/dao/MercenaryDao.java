package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.mercenaryDto;

public interface MercenaryDao {
	String NAMESPACE = "mercenary_info.";
	
	public mercenaryDto mercenaryDetail(mercenaryDto dto);
}
