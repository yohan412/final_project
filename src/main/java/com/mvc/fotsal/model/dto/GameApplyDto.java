package com.mvc.fotsal.model.dto;

public class GameApplyDto {
	
	private int game_no;
	private int user_no;
	
	public GameApplyDto() {
		super();
	}

	public GameApplyDto(int game_no, int user_no) {
		super();
		this.game_no = game_no;
		this.user_no = user_no;
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
	
	
	
}
