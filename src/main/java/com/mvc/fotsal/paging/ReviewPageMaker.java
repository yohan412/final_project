package com.mvc.fotsal.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class ReviewPageMaker {
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 5;
    private ReviewPaging reviewPaging;

    public void setReviewPaging(ReviewPaging reviewPaging){
        this.reviewPaging = reviewPaging;
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

    public ReviewPaging getReviewPaging(){
        return reviewPaging;
    }

    public void calcDate(){
        endPage = (int) (Math.ceil(reviewPaging.getPage() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) reviewPaging.getPerPageNum()));

        if(endPage > tempEndPage){
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * reviewPaging.getPerPageNum() >= totalCount ? false : true;
    }

    public String makeQuery(int page){
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                                    .queryParam("page", page)
                                    .queryParam("perPageNum", reviewPaging.getPerPageNum())
                                    .build();

        return uriComponents.toUriString();
    }
}

