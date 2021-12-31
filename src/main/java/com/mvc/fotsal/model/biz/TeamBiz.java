package com.mvc.fotsal.model.biz;

import java.util.List;

import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamDto;
import com.mvc.fotsal.paging.TeamSearch;

public interface TeamBiz {
	
	public List<TeamDto> selectList(TeamSearch STLP); // 팀 리스트 및 페이징
	public int listCount(TeamSearch STLP); // 팀 총 갯수
	
	public TeamDto selectOne(int team_no); // 팀 자세히보기
	
	public int insert(TeamDto dto); // 팀 등록
	
	public int update(TeamDto dto); // 팀 수정
	
	public int delete(int team_no); // 팀 삭제
	
	public int teampic(PicDto dto); // 팀 등록 시 이미지 업로드 및 path 경로
	
	public int findno(TeamDto dto); // 팀 등록 시 team_no 번호 판단여부
	
}