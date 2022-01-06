package com.mvc.fotsal.model.dto;

public class MercenaryDto {
	private int user_no; // 유저 테이블의 user_no
	private String user_id; // 유저 테이블의 user_id
	private String mercenary_intro; // 자기소개
	private String mercenary_foot; // 주발
	private double mercenary_rate; //승률
	private String mercenary_position; //포지션
	private int game_no; // 경기 번호
	private int team_no; // 팀 번호
	
	public MercenaryDto() {
		super();
	}

	public MercenaryDto(int user_no, String mercenary_intro, String mercenary_foot, double mercenary_rate,
			String mercenary_position, String user_id, int game_no, int team_no) {
		super();
		this.user_no = user_no;
		this.mercenary_intro = mercenary_intro;
		this.mercenary_foot = mercenary_foot;
		this.mercenary_rate = mercenary_rate;
		this.mercenary_position = mercenary_position;
		this.user_id = user_id;
		this.game_no = game_no;
		this.team_no = team_no;
	}

	public int getTeam_no() {
		return team_no;
	}

	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}

	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setMercenary_rate(double mercenary_rate) {
		this.mercenary_rate = mercenary_rate;
	}

	public String getMercenary_intro() {
		return mercenary_intro;
	}

	public void setMercenary_intro(String mercenary_intro) {
		this.mercenary_intro = mercenary_intro;
	}

	public String getMercenary_foot() {
		return mercenary_foot;
	}

	public void setMercenary_foot(String mercenary_foot) {
		this.mercenary_foot = mercenary_foot;
	}

	public double getMercenary_rate() {
		return mercenary_rate;
	}

	public void setMercenary_rate(int mercenary_rate) {
		this.mercenary_rate = mercenary_rate;
	}

	public String getMercenary_position() {
		return mercenary_position;
	}

	public void setMercenary_position(String mercenary_position) {
		this.mercenary_position = mercenary_position;
	}

	
}

	