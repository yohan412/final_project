package com.mvc.fotsal.model.dto;

public class TeamApplyDto {
	private int team_no;
	private int user_no;
	
	public TeamApplyDto() {
		super();
	}

	public TeamApplyDto(int team_no, int user_no) {
		super();
		this.team_no = team_no;
		this.user_no = user_no;
	}

	public int getTeam_no() {
		return team_no;
	}

	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	
	
}
