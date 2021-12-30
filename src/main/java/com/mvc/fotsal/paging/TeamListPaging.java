package com.mvc.fotsal.paging;

public class TeamListPaging {
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	public TeamListPaging() {
		this.page = 1; // 시작페이지
		this.perPageNum = 10; // 뷰에서의 최대 표현 페이지
	}

	public void setPage(int page) {
		if(page <= 0) { // 페이지 시작이 0이거나 더 작게 시작한다면
			this.page = 1; // 1페이지부터 시작하게끔 설정
			return;
		}
		this.page = page; // 1페이지부터 시작하게끔 강제설정
	}


	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) { // 0보다 작거나 0과 같거나 and 99보다 작다면, 즉 범위를 1~99까지로 제한
 			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "TeamListPaging [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
}