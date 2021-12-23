package com.mvc.fotsal.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.fotsal.model.dao.TeamDao;
import com.mvc.fotsal.model.dto.TeamDto;

@Service
public class TeamBizImpl implements TeamBiz{

	@Autowired
	private TeamDao dao;

	@Override
	public List<TeamDto> selectList() {
		return null;
	}

	@Override
	public TeamDto selectOne(int team_no) {
		return null;
	}

	@Override
	public int insert(TeamDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(TeamDto dto) {
		return 0;
	}

	@Override
	public int delete(int team_no) {
		return 0;
	}
	
	
}
