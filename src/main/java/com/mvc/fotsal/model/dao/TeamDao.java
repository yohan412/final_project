package com.mvc.fotsal.model.dao;

import java.util.List;

import com.mvc.fotsal.model.dto.MercenaryDto;
import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.TeamListPaging;
import com.mvc.fotsal.paging.TeamSearch;

public interface TeamDao {
	String NAMESPACE = "team_info.";
	
	public TeamDto selectOne(int team_no); // 팀 자세히보기 
	
	public int insert(TeamDto dto); // 팀 등록
	
	public int update(TeamDto dto); // 팀 수정
	
	public int delete(int team_no); // 팀 삭제
	
	public int teampic(PicDto dto); // 팀 등록시 이미지 업로드
	
	public int findno(TeamDto dto); // 팀 등록시 이미지와 동일한 team_no 여부 판단
	
	public List<TeamDto> selectList(TeamSearch STLP); // 팀 리스트 및 페이징
	
	public int listCount(TeamSearch STLP); // 팀 총 갯수

	public int updatePic(PicDto dto); // 팀 파일 업로드 수정

	public int applyInsert(int user_no, int team_no); // 팀 지원자 insert 

	public List<UserDto> applyList(int team_no); // 팀 지원자 리스트

	public UserDto selectInfo(String user_id); // 팀 지원자 초대발송할때 누군지 판단

	public int selectid(String user_id); // 검색창에 user_id값 안넘어가서 넘기는것

}
