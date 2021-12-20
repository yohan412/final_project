package com.mvc.fotsal.model.dto;

import java.util.Date;

public class GameAskDto {
    private int ask_no;
    private int game_no;
    private String ask_type;
    private int ask_gpno;
    private int gpsq;
    private String user_id;
    private String ask_content;
    private Date ask_reg;
    private String aks_status;

    public GameAskDto() {
    }

    public GameAskDto(int ask_no, int game_no, String ask_type, int ask_gpno, int gpsq, String user_id, String ask_content, Date ask_reg, String aks_status) {
        this.ask_no = ask_no;
        this.game_no = game_no;
        this.ask_type = ask_type;
        this.ask_gpno = ask_gpno;
        this.gpsq = gpsq;
        this.user_id = user_id;
        this.ask_content = ask_content;
        this.ask_reg = ask_reg;
        this.aks_status = aks_status;
    }

    public int getAsk_no() {
        return ask_no;
    }

    public void setAsk_no(int ask_no) {
        this.ask_no = ask_no;
    }

    public int getGame_no() {
        return game_no;
    }

    public void setGame_no(int game_no) {
        this.game_no = game_no;
    }

    public String getAsk_type() {
        return ask_type;
    }

    public void setAsk_type(String ask_type) {
        this.ask_type = ask_type;
    }

    public int getAsk_gpno() {
        return ask_gpno;
    }

    public void setAsk_gpno(int ask_gpno) {
        this.ask_gpno = ask_gpno;
    }

    public int getGpsq() {
        return gpsq;
    }

    public void setGpsq(int gpsq) {
        this.gpsq = gpsq;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getAsk_content() {
        return ask_content;
    }

    public void setAsk_content(String ask_content) {
        this.ask_content = ask_content;
    }

    public Date getAsk_reg() {
        return ask_reg;
    }

    public void setAsk_reg(Date ask_reg) {
        this.ask_reg = ask_reg;
    }

    public String getAks_status() {
        return aks_status;
    }

    public void setAks_status(String aks_status) {
        this.aks_status = aks_status;
    }
}
