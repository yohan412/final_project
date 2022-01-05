package com.mvc.fotsal.model.dto;

public class StadiumDto {
    private int stadium_no;
    private String stadium_name;
    private String stadium_addr;
    private String stadium_content;
    private String stadium_webaddr;
    private String stadium_phonenum;
    private String pic_path;

    public StadiumDto() {
    }

    public StadiumDto(int stadium_no, String stadium_name, String stadium_addr, String stadium_content, String stadium_webaddr, String stadium_phonenum) {
        this.stadium_no = stadium_no;
        this.stadium_name = stadium_name;
        this.stadium_addr = stadium_addr;
        this.stadium_content = stadium_content;
        this.stadium_webaddr = stadium_webaddr;
        this.stadium_phonenum = stadium_phonenum;
    }

    public int getStadium_no() {
        return stadium_no;
    }

    public void setStadium_no(int stadium_no) {
        this.stadium_no = stadium_no;
    }

    public String getStadium_name() {
        return stadium_name;
    }

    public void setStadium_name(String stadium_name) {
        this.stadium_name = stadium_name;
    }

    public String getStadium_addr() {
        return stadium_addr;
    }

    public void setStadium_addr(String stadium_addr) {
        this.stadium_addr = stadium_addr;
    }

    public String getStadium_content() {
        return stadium_content;
    }

    public void setStadium_content(String stadium_content) {
        this.stadium_content = stadium_content;
    }

    public String getStadium_webaddr() {
        return stadium_webaddr;
    }

    public void setStadium_webaddr(String stadium_webaddr) {
        this.stadium_webaddr = stadium_webaddr;
    }

    public String getStadium_phonenum() {
        return stadium_phonenum;
    }

    public void setStadium_phonenum(String stadium_phonenum) {
        this.stadium_phonenum = stadium_phonenum;
    }

    public String getPic_path() {
        return pic_path;
    }

    public void setPic_path(String pic_path) {
        this.pic_path = pic_path;
    }
}
