package com.mvc.fotsal.model.dto;

import java.util.Date;

public class ReviewDto {
    private int     review_no;
    private String  user_id;
    private Date    review_reg;
    private String  review_title;
    private String  review_content;
    private int     stadium_no;

    public ReviewDto() {
    }

    public ReviewDto(int review_no, String user_id, Date review_reg, String review_title, String review_content, int stadium_no) {
        this.review_no = review_no;
        this.user_id = user_id;
        this.review_reg = review_reg;
        this.review_title = review_title;
        this.review_content = review_content;
        this.stadium_no = stadium_no;
    }

    public int getReview_no() {
        return review_no;
    }

    public void setReview_no(int review_no) {
        this.review_no = review_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Date getReview_reg() {
        return review_reg;
    }

    public void setReview_reg(Date review_reg) {
        this.review_reg = review_reg;
    }

    public String getReview_title() {
        return review_title;
    }

    public void setReview_title(String review_title) {
        this.review_title = review_title;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public int getStadium_no() {
        return stadium_no;
    }

    public void setStadium_no(int stadium_no) {
        this.stadium_no = stadium_no;
    }
}
