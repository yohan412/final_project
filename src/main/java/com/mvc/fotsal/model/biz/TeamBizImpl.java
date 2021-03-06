package com.mvc.fotsal.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.fotsal.model.dao.TeamDao;
import com.mvc.fotsal.model.dto.MercenaryDto;
import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.TeamSearch;

@Service
public class TeamBizImpl implements TeamBiz{

	@Autowired
	private TeamDao dao;

	@Override
	public List<TeamDto> selectList(TeamSearch STLP) {
		return dao.selectList(STLP);
	}
	
	@Override
	public int listCount(TeamSearch STLP) {
		return dao.listCount(STLP);
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
		return dao.delete(team_no);
	}

	@Override
	public int teampic(PicDto dto) {
		return dao.teampic(dto);
	}
	
	@Override
	public int findno(TeamDto dto) {
		return dao.findno(dto);
	}

	@Override
	public int updatePic(PicDto dto) {
		return dao.updatePic(dto);
	}

	@Override
	public int applyInsert(int user_no, int team_no) {
		return dao.applyInsert(user_no, team_no);
	}

	@Override
	public List<UserDto> uDto(int team_no) {
		return dao.applyList(team_no);
	}

	@Override
	public UserDto selectInfo(String user_id) {
		
		return dao.selectInfo(user_id);
	}

	@Override
	public int selectid(String user_id) {
		return dao.selectid(user_id);
	}


	
	
}
