package com.mvc.fotsal.paging;

public class StadiumSearch extends StadiumPaging{
    private String searchType = "";
    private String keyword = "";
    private String addr = "";

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    @Override
    public String toString() {
        return "StadiumSearch{" +
                "searchType='" + searchType + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
