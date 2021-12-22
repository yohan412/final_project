package com.mvc.fotsal.model.dto;

public class MercenaryDto {
	private int user_no; // 유저 테이블의 user_no 
	private String mercenary_intro; // 자기소개
	private String mercenary_foot; // 주발
	private double mercenary_rate; //승률
	private String mercenary_position; //포지션
	
	public MercenaryDto() {
		super();
	}

	public MercenaryDto(int user_no, String mercenary_intro, String mercenary_foot, double mercenary_rate,
			String mercenary_position) {
		super();
		this.user_no = user_no;
		this.mercenary_intro = mercenary_intro;
		this.mercenary_foot = mercenary_foot;
		this.mercenary_rate = mercenary_rate;
		this.mercenary_position = mercenary_position;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
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

	