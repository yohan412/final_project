package com.mvc.fotsal.model.dto;

public class TeamDto {
	private int user_no; // 유저번호
	private String team_name; //팀명
	private String team_intro; //팀소개
	private int team_no; //팀번호
	private char team_addchk; //모집여부
	
	public TeamDto() {
		super();
	}

	public TeamDto(int user_no, String team_name, String team_intro, int team_no, char team_addchk) {
		super();
		this.user_no = user_no;
		this.team_name = team_name;
		this.team_intro = team_intro;
		this.team_no = team_no;
		this.team_addchk = team_addchk;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getTeam_intro() {
		return team_intro;
	}

	public void setTeam_intro(String team_intro) {
		this.team_intro = team_intro;
	}

	public int getTeam_no() {
		return team_no;
	}

	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}

	public char getTeam_addchk() {
		return team_addchk;
	}

	public void setTeam_addchk(char team_addchk) {
		this.team_addchk = team_addchk;
	}
	
}
