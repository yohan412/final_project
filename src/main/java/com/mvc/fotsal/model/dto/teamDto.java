package com.mvc.fotsal.model.dto;

public class teamDto {
	private String team_name; //팀명
	private String team_intro; //팀소개
	private int team_no; //팀번호
	private char team_addchk; //모집여부
	
	public teamDto() {
		super();
	}

	public teamDto(String team_name, String team_intro, int team_no, char team_addchk) {
		super();
		this.team_name = team_name;
		this.team_intro = team_intro;
		this.team_no = team_no;
		this.team_addchk = team_addchk;
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
