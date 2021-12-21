package com.mvc.fotsal.model.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class GameAskPageMaker {
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 10;
    private GameAskPaging gameAskPaging;

    public void setGameAskPaging(GameAskPaging gameAskPaging){
        this.gameAskPaging = gameAskPaging;
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

    public GameAskPaging getGameAskPaging(){
        return gameAskPaging;
    }

    private void calcDate(){
        endPage = (int) (Math.ceil(gameAskPaging.getPage() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) gameAskPaging.getPerPageNum() ) );

        if(endPage > tempEndPage){
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * gameAskPaging.getPerPageNum() >= totalCount ? false : true;
    }

    public String makeQuery(int page){
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", gameAskPaging.getPerPageNum())
                        .build();

        return uriComponents.toUriString();
    }
}
