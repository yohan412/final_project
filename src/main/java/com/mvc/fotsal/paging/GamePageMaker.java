package com.mvc.fotsal.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class GamePageMaker {
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 5;
    private GamePaging gamePaging;

    public void setGamePaging(GamePaging gamePaging){
        this.gamePaging = gamePaging;
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

    public GamePaging getGamePaging(){
        return gamePaging;
    }

    private void calcDate(){
        endPage = (int) (Math.ceil(gamePaging.getPage() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) gamePaging.getPerPageNum() ) );

        if(endPage > tempEndPage){
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * gamePaging.getPerPageNum() >= totalCount ? false : true;
    }

    public String makeQuery(int page){
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", gamePaging.getPerPageNum())
                        .build();

        return uriComponents.toUriString();
    }

    public String makeSearch(int page){
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", gamePaging.getPerPageNum())
                        .queryParam("searchType", ((GameSearch)gamePaging).getSearchType())
                        .queryParam("keyword", encoding(((GameSearch)gamePaging).getKeyword()))
                        .build();
        return uriComponents.toUriString();
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
