package com.mvc.fotsal.model.dto;

public class PicDto {
	private int boardno;
	private String pic_name;
	private String pic_path;
	
	public PicDto() {
		super();
	}
	
	public PicDto(int boardno, String pic_name, String pic_path) {
		super();
		this.boardno = boardno;
		this.pic_name = pic_name;
		this.pic_path = pic_path;
	}

	

	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	
	
}
