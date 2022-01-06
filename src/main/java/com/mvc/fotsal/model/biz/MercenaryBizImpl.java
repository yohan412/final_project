package com.mvc.fotsal.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.fotsal.model.dao.MercenaryDao;
import com.mvc.fotsal.model.dto.MercenaryDto;

@Service
public class MercenaryBizImpl implements MercenaryBiz{
	
	@Autowired
	private MercenaryDao dao;

	@Override
	public MercenaryDto selectOne(int user_no) {
		return dao.selectOne(user_no);
	}

	@Override
	public int insert(MercenaryDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(MercenaryDto dto) {
		
		return dao.update(dto);
	}

	@Override
	public int delete(int user_no) {
		
		return dao.delete(user_no);
	}

	@Override
	public List<MercenaryDto> selectList(MercenaryDto mDto) {
		
		return dao.selectList(mDto);
	}

	@Override
	public List<MercenaryDto> selectListT(MercenaryDto mDto) {
		return dao.selectListT(mDto);
	}
}
