package com.mvc.fotsal.model.dao;

import java.util.List;

import com.mvc.fotsal.model.dto.TeamDto;

public interface TeamDao {
	String NAMESPACE = "team_info.";
	
	public TeamDto teamDetail(TeamDto dto);
	public List<TeamDto> selectList();
	public TeamDto selectOne(int team_no);
	public int insert(TeamDto dto);
	public int update(TeamDto dto);
	public int delete(int team_no);
}
