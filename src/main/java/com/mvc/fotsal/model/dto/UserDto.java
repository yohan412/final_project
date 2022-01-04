package com.mvc.fotsal.model.dto;

public class UserDto {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_gender;
	private String user_birthdate;
	private String user_email;
	private String user_phone;
	private String user_zip;
	private String user_addr;
	private String user_role;
	private String user_conchk;
	public UserDto() {
		super();
	}
	public UserDto(int user_no, String user_id, String user_pw, String user_name, String user_gender,
			String user_birthdate, String user_email, String user_phone, String user_zip, String user_addr,
			String user_role, String user_conchk) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_gender = user_gender;
		this.user_birthdate = user_birthdate;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_zip = user_zip;
		this.user_addr = user_addr;
		this.user_role = user_role;
		this.user_conchk = user_conchk;
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
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_birthdate() {
		return user_birthdate;
	}
	public void setUser_birthdate(String user_birthdate) {
		this.user_birthdate = user_birthdate;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_zip() {
		return user_zip;
	}
	public void setUser_zip(String user_zip) {
		this.user_zip = user_zip;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	public String getUser_conchk() {
		return user_conchk;
	}
	public void setUser_conchk(String user_conchk) {
		this.user_conchk = user_conchk;
	}
	
	
}
