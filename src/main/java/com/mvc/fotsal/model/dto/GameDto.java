package com.mvc.fotsal.model.dto;

import java.util.Date;

public class GameDto {
    private int     game_no;            //경기 번호
    private String  user_id;            //작성자
    private String  game_region;        //경기 지역 이름
    private String  game_stadium;       //경기장 이름
    private String  game_addr;          //경기장 주소
    private Date    game_date;          //경기 날짜
    private String  game_time;          //경기 시간
    private int     game_people;        //팀 인원
    private int     game_mercenary;     //용병 모집 종류
    private String  game_content;       //기타 내용
    private String  game_type;          //경기 타입

    public GameDto() {
    }

    public GameDto(int game_no, String user_id, String game_region, String game_stadium, String game_addr, Date game_date, String game_time, int game_people, int game_mercenary, String game_content, String game_type) {
        this.game_no = game_no;
        this.user_id = user_id;
        this.game_region = game_region;
        this.game_stadium = game_stadium;
        this.game_addr = game_addr;
        this.game_date = game_date;
        this.game_time = game_time;
        this.game_people = game_people;
        this.game_mercenary = game_mercenary;
        this.game_content = game_content;
        this.game_type = game_type;
    }

    public int getGame_no() {
        return game_no;
    }

    public void setGame_no(int game_no) {
        this.game_no = game_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getGame_region() {
        return game_region;
    }

    public void setGame_region(String game_region) {
        this.game_region = game_region;
    }

    public String getGame_stadium() {
        return game_stadium;
    }

    public void setGame_stadium(String game_stadium) {
        this.game_stadium = game_stadium;
    }

    public String getGame_addr() {
        return game_addr;
    }

    public void setGame_addr(String game_addr) {
        this.game_addr = game_addr;
    }

    public Date getGame_date() {
        return game_date;
    }

    public void setGame_date(Date game_date) {
        this.game_date = game_date;
    }

    public String getGame_time() {
        return game_time;
    }

    public void setGame_time(String game_time) {
        this.game_time = game_time;
    }

    public int getGame_people() {
        return game_people;
    }

    public void setGame_people(int game_people) {
        this.game_people = game_people;
    }

    public int getGame_mercenary() {
        return game_mercenary;
    }

    public void setGame_mercenary(int game_mercenary) {
        this.game_mercenary = game_mercenary;
    }

    public String getGame_content() {
        return game_content;
    }

    public void setGame_content(String game_content) {
        this.game_content = game_content;
    }

    public String getGame_type() {
        return game_type;
    }

    public void setGame_type(String game_type) {
        this.game_type = game_type;
    }
}
