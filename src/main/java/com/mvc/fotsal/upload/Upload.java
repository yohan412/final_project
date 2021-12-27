package com.mvc.fotsal.upload;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamDto;

public class Upload {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int teampic(PicDto pic){
		
		String NAMESPACE = "team_info.";
		
		int res =0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insert_pic", pic);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int findno(TeamDto dto) {
		
		String NAMESPACE = "team_info.";
		
		TeamDto teamdto = null;
		
		try {
			teamdto=sqlSession.selectOne(NAMESPACE+"findNo",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return teamdto.getTeam_no();
	}

}
