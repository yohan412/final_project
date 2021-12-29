package com.mvc.fotsal.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamDto;

@Repository
public class TeamDaoImpl implements TeamDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public TeamDto teamDetail(TeamDto dto) {
		return null;
	}

	@Override
	public List<TeamDto> selectList() {
		List<TeamDto> teamlist = new ArrayList<TeamDto>();
		
		try {
			teamlist = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("error: select list failed");
			e.printStackTrace();
		}
		
		return teamlist;
	}

	@Override
	public TeamDto selectOne(int team_no) {
		
		TeamDto detail = null;
		
		try {
			detail = sqlSession.selectOne(NAMESPACE+"selectOne",team_no);
		} catch (Exception e) {
			System.out.println("error: select detail failed");
			e.printStackTrace();
		}
		
		
		return detail;
	}
	
	@Override
	public int insert(TeamDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			System.out.println("error: team insert failed");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(TeamDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("error: team update failed");
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int delete(int team_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete",team_no);
		} catch (Exception e) {
			System.out.println("error: team delete failed");
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	@Override
	public int teampic(PicDto pic){
		
		String NAMESPACE = "team_info.";
		
		int res =0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insert_pic", pic);
		} catch (Exception e) {
			System.out.println("error: teampic");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int findno(TeamDto dto) {
		
		String NAMESPACE = "team_info.";
		
		TeamDto teamdto = null;
		
		try {
			teamdto=sqlSession.selectOne(NAMESPACE+"findNo",dto);
		} catch (Exception e) {
			System.out.println("error: findno");
			e.printStackTrace();
		}
		
		return teamdto.getTeam_no();
	}

}
