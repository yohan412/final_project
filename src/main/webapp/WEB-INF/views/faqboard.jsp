<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ BOARD</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/faqboard.css">
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
<link href="https://webfontworld.github.io/mapo/MapoDPP.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
    </style>
</head>

<body>
	<header>
		<%@ include file="/WEB-INF/views/header.jsp"%>
	</header>
	<section class="body">
	<div>
		<h1 style="display: flex; justify-content: center;">FAQ 게시판</h1>
	</div>
	<input type="hidden" name="user_id" value="${login.getUser_id()}">
		<div class="main-all-box">
			<div class="list-all-box">
				<div id="boardselect_form">
					<div id="board_list">
						<div id="boardselect_form">
							<div class="boardselect" id="faq">
								<button id="pointer" style="width: 200px; height: 13px;" onclick="location.href='faqlist.do'">FAQ</button>
							</div>
							<div class="boardselect" id="qna">
								<button id="pointer" style="width: 200px; height: 13px;" onclick="location.href='qnalist.do'">Q&A</button>
							</div>
						</div>
					</div>
				</div>
			
				<!-- list start -->
				<div class="board_list">
					<table class="qna-table" style="text-align: center; inline-block; border: 1px solid #dddddd; width: 700px;" align="center">
						<colgroup>
							<col class="faq_no">
							<col class="faq_title">
							<col class="faq_content">
							<col class="faq_date">
						</colgroup>
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center; width: 5%;">번호</th>
							<th style="background-color: #eeeeee; text-align: center; width: 20%;">문의 내용</th>
							<th style="background-color: #eeeeee; text-align: center; width: 45%;">답변 내용</th>
							<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list }">
								<tr>
									<td colspan="5" align="center">-------- 작성된 글이 없습니다--------</td>
								</tr>
							</c:when>
								<c:otherwise>
											<c:forEach items="${list }" var="faq_dto">
												<tr>
													<td>${faq_dto.faq_no }</td>
													<td><a href="faqdetail.do?faq_no=${faq_dto.faq_no }">${faq_dto.faq_title }</a></td>
													<td>${faq_dto.faq_content }</td>
													<td><fmt:formatDate value="${faq_dto.faq_reg }" pattern="yyyy-MM-dd"/></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
							
					<!-- 페이지 리스트 -->
					<div class="page-list" align="center">
					<c:if test="${pageMaker.prev }">
						<input type="button" id="prev-btn" onclick="location.href='faqlist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}'" value="<<">
					</c:if>

					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
					<c:choose>
						<c:when test="${idx eq page }">
							<input type="button" id="pagingnumClick" value="${idx }">
						</c:when>
						<c:otherwise>
							<input type="button" id="pagingnum" onclick="location.href='faqlist.do${pageMaker.makeSearch(idx) }'" value="${idx}">
						</c:otherwise>
					</c:choose>
					</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<input type="button" id="next-btn" onclick="location.href='faqlist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}'" value=">>">
						</c:if>
					</div>
					<!-- faq글작성 -->
					<div class="content-submit-list" align="center">
						<button id="pointer" name="write-hidden" onclick="location.href='faq.do'">작성하기</button>
					</div>
					<br>
				<!-- 서치 폼 -->
				<div class="serch" align="center">
					<select name="searchType" id="searchOption">
						<option value="n"><c:out value="${STLP.searchType == null ? 'selected' : ''}" />분류없음</option>
						<option value="t"><c:out value="${STLP.searchType eq 't' ? 'selected' : ''}" />>문의내용</option>
						<option value="c"><c:out value="${STLP.searchType eq 'c' ? 'selected' : ''}" />>답변내용</option>
					</select>
					<input type="text" name="keyword" id="keywordInput" value="${STLP.keyword}" required=""/>
					<label alt='검색어를 입력하세요' placeholder=''></label>
					<input type="image" id="searchBtn" src="img/icon_magnifier.png">
				</div>
			
		
		</div>
	</div>
</section>

</body>
<footer style="align-content: center;">
	<%@ include file="footer.jsp"%>
</footer>
<script type="text/javascript">

	$(function(){
	var user_id = '${login.user_id}';  // 세션에 저장된 로그인 아이디
	var adminChk = '${login.user_role}'; // 어드민 여부
	
		$("button[name=write-hidden]").hide();
	if(adminChk === 'ADMIN'){
		$("button[name=write-hidden]").show();
	}else{
		$("button[name=write-hidden]").hide();
	}
});

</script>
</html>