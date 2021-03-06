package com.mvc.fotsal.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class StadiumPageMaker {
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 5;
    private StadiumPaging stadiumPaging;

    public void setStadiumPaging(StadiumPaging stadiumPaging){
        this.stadiumPaging = stadiumPaging;
    }

    public void setTotalCount(int totalCount){
        this.totalCount = totalCount;
        calcDate();
    }

    public int getTotalCount(){
        return totalCount;
    }

    public int getStartPage(){
        return startPage;
    }

    public int getEndPage(){
        return endPage;
    }

    public boolean isPrev(){
        return prev;
    }

    public boolean isNext(){
        return next;
    }

    public int getDisplayPageNum(){
        return displayPageNum;
    }

    public StadiumPaging getStadiumPaging(){
        return stadiumPaging;
    }

    private void calcDate(){
        endPage     = (int) (Math.ceil(stadiumPaging.getPage() / (double)displayPageNum) * displayPageNum);
        startPage   = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) stadiumPaging.getPerPageNum()));
        if(endPage > tempEndPage){
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * stadiumPaging.getPerPageNum() >= totalCount ? false : true;
    }

    public String makeQuery(int page){
        UriComponents uriComponents =
        UriComponentsBuilder.newInstance()
                            .queryParam("page", page)
                            .queryParam("perPageNum", stadiumPaging.getPerPageNum())
                            .build();

        return uriComponents.toUriString();
    }

    public String makeSearch(int page){
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", stadiumPaging.getPerPageNum())
                        .queryParam("searchType", ((StadiumSearch)stadiumPaging).getSearchType())
                        .queryParam("keyword",  encoding( ( (StadiumSearch)stadiumPaging).getKeyword() ) )
                        .queryParam("addr",     encoding( ( (StadiumSearch)stadiumPaging).getAddr() ) )
                        .build();
        return  uriComponents.toUriString();
    }

    private String encoding(String keyword){
        if(keyword == null || keyword.trim().length() == 0){
            return "";
        }

        try{
            return URLEncoder.encode(keyword, "UTF-8");
        }catch (UnsupportedEncodingException e){
            return "";
        }
    }

}
