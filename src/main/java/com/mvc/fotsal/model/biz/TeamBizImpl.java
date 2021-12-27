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
		return dao.selectList();
	}

	@Override
	public TeamDto selectOne(int team_no) {
		
		return dao.selectOne(team_no);
	}

	@Override
	public int insert(TeamDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(TeamDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int team_no) {
		return 0;
	}
	
	
}
