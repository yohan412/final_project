package com.mvc.fotsal.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamApplyDto;
import com.mvc.fotsal.model.dto.TeamDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.TeamSearch;

@Repository
public class TeamDaoImpl implements TeamDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<TeamDto> selectList(TeamSearch STLP) {
		List<TeamDto> teamlist = new ArrayList<TeamDto>();
		
		try {
			teamlist = sqlSession.selectList(NAMESPACE+"selectList", STLP);
		} catch (Exception e) {
			System.out.println("error: select list failed");
			e.printStackTrace();
		}
		
		return teamlist;
	}
	
	@Override
	public int listCount(TeamSearch STLP) {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"listCount", STLP);
		} catch (Exception e) {
			System.out.println("error: select listCount failed");
			e.printStackTrace();
		}
		
		return res;
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

	@Override
	public int updatePic(PicDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updatePic", dto);
		} catch (Exception e) {
			System.out.println("error: updatePic failed");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int applyInsert(int user_no, int team_no) {
		TeamApplyDto dto = new TeamApplyDto(user_no, team_no);
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "applyInsert", dto);
		} catch (Exception e) {
			System.out.println("error: applyInsert failed");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<UserDto> applyList(int team_no) {
		System.out.println("애플라이리스트에서 team_no: "+team_no);
		List<UserDto> res = new ArrayList<UserDto>();
		
		res = sqlSession.selectList(NAMESPACE+"applyList", team_no);
		
		return res;
	}

	@Override
	public UserDto selectInfo(String user_id) {
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "selectInfo", user_id);
		} catch (Exception e) {
			System.out.println("error: selectInfo failed");
			e.printStackTrace();
		}
		
		return res;
	}



}
