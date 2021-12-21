package com.mvc.fotsal.model.dto;

import java.util.Date;

public class FaqBoardDto {
	private int faq_no;
	private int faq_gpno;
	private int faq_gpsq;
	private String faq_title;
	private String faq_content;
	private String user_id;
	private Date faq_reg;
	private String faq_type;
	public FaqBoardDto() {
		super();
	}
	public FaqBoardDto(int faq_no, int faq_gpno, int faq_gpsq, String faq_title, String faq_content, String user_id,
			Date faq_reg, String faq_type) {
		super();
		this.faq_no = faq_no;
		this.faq_gpno = faq_gpno;
		this.faq_gpsq = faq_gpsq;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.user_id = user_id;
		this.faq_reg = faq_reg;
		this.faq_type = faq_type;
	}
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public int getFaq_gpno() {
		return faq_gpno;
	}
	public void setFaq_gpno(int faq_gpno) {
		this.faq_gpno = faq_gpno;
	}
	public int getFaq_gpsq() {
		return faq_gpsq;
	}
	public void setFaq_gpsq(int faq_gpsq) {
		this.faq_gpsq = faq_gpsq;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getFaq_reg() {
		return faq_reg;
	}
	public void setFaq_reg(Date faq_reg) {
		this.faq_reg = faq_reg;
	}
	public String getFaq_type() {
		return faq_type;
	}
	public void setFaq_type(String faq_type) {
		this.faq_type = faq_type;
	}
	
}
