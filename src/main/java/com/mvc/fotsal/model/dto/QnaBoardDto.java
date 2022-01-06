package com.mvc.fotsal.model.dto;

import java.util.Date;

public class QnaBoardDto {
	private int qna_no;
	private int qna_gpno;
	private int qna_gpsq;
	private String qna_title;
	private String qna_content;
	private String user_id;
	private int user_no;
	private Date qna_reg;
	private String qna_type;
	
	public QnaBoardDto() {
		super();
	}
	public QnaBoardDto(int user_no, int qna_no, int qna_gpno, int qna_gpsq, String qna_title, String qna_content, String user_id,
			Date qna_reg, String qna_type) {
		super();
		this.user_no = user_no;
		this.qna_no = qna_no;
		this.qna_gpno = qna_gpno;
		this.qna_gpsq = qna_gpsq;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.user_id = user_id;
		this.qna_reg = qna_reg;
		this.qna_type = qna_type;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getQna_gpno() {
		return qna_gpno;
	}
	public void setQna_gpno(int qna_gpno) {
		this.qna_gpno = qna_gpno;
	}
	public int getQna_gpsq() {
		return qna_gpsq; 
	}
	public void setQna_gpsq(int qna_gpsq) {
		this.qna_gpsq = qna_gpsq;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getQna_reg() {
		return qna_reg;
	}
	public void setQna_reg(Date qna_reg) {
		this.qna_reg = qna_reg;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	
	
	
}
