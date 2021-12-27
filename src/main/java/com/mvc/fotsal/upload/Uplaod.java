package com.mvc.fotsal.upload;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.fotsal.model.dto.PicDto;

public class Uplaod {
	
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

}
