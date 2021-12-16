package com.mvc.fotsal.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.fotsal.model.dao.MercenaryDao;
import com.mvc.fotsal.model.dto.MercenaryDto;

@Service
public class MercenaryBizImpl implements MercenaryBiz{
	
	@Autowired
	private MercenaryDao dao;

	@Override
	public MercenaryDto mercenaryDetail(MercenaryDto dto) {
		return null;
	}

	@Override
	public int insert(MercenaryDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(MercenaryDto dto) {
		return 0;
	}

	@Override
	public int delete(int user_no) {
		return 0;
	}
}
