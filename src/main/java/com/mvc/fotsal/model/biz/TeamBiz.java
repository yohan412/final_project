package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamDto;

public interface TeamBiz {
	
	public List<TeamDto> selectList();
	public TeamDto selectOne(int team_no);
	public int insert(TeamDto dto);
	public int update(TeamDto dto);
	public int delete(int team_no);
	public int teampic(PicDto dto);
	public int findno(TeamDto dto);
	
}
