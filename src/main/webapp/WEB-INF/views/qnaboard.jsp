<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A BOARD</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/board.css">
<link href="https://webfontworld.github.io/mapo/MapoDPP.css" rel="stylesheet">
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
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
		<h1 style="display: flex; justify-content: center;">Q&A 게시판</h1>
	</div>
	<div class="main-all-box">
		<div class="list-all-box">
			<div id="boardselect_form">
				<div id="board_list">
					<div id="boardselect_form">
						<div class="boardselect" id="faq">
						<button id="pointer" onclick="location.href='faqlist.do'">FAQ</button>
						</div>
						<div class="boardselect" id="qna">
							<button id="pointer" onclick="location.href='qnalist.do'">Q&A</button>
						</div>
					</div>
				</div>
			</div>


		<!-- list start -->
			<div class="board_list">
					<table class="qna-table"style="text-align: center; inline-block; border: 1px solid #dddddd; width: 900px;" align="center">
						<colgroup>
							<col class="qna_no">
							<col class="qna_writer">
							<col class="qna_title">
							<col class="qna_content">
							<col class="qna_date">
						</colgroup>
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center; width: 10%;">번호</th>
								<th style="background-color: #eeeeee; text-align: center; width: 10%;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center; width: 20%;">제목</th>
								<th style="background-color: #eeeeee; text-align: center; width: 40%;">내용</th>
								<th style="background-color: #eeeeee; text-align: center; width: 10%;">작성일</th>
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
									<c:forEach items="${list }" var="dto">
										<c:choose>	
											<c:when test="${dto.qna_gpsq eq 1 }">
												<tr>
													<td>${dto.qna_no }</td>
													<td>${dto.user_id}</td>
														<td><a href="qnadetail.do?qna_gpno=${dto.qna_gpno }">${dto.qna_title }</a></td>
													<td>${dto.qna_content }</td>
													<td>${dto.qna_reg }</td>
												</tr>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			<!-- 페이지 리스트 -->
			<div class="page-list" align="center">

				<c:if test="${pageMaker.prev }">
					<input type="button" id="prev-btn" onclick="location.href='qnalist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}'" value="<<">
				</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
					<c:choose>
						<c:when test="${idx eq page }">
							<input type="button" id="pagingnumClick" value="${idx }">
						</c:when>
						<c:otherwise>
							<input type="button" id="pagingnum" onclick="location.href='qnalist.do${pageMaker.makeSearch(idx) }'" value="${idx}">
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<input type="button" id="next-btn" onclick="location.href='qnalist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}'" value=">>">
				</c:if>
			</div>
			<!-- 글작성 -->
			<div class="content-submit-list" align="center">
				<button id="pointer" onclick="loginChk(${login.user_no})">작성하기</button>
			</div>
			<!-- 서치 폼 -->
			<div class="serch" align="center">
				<select name="searchType" id="searchOption">
					<option value="n"><c:out value="${STLP.searchType == null ? 'selected' : ''}"/>분류없음</option>
					<option value="t"><c:out value="${STLP.searchType eq 't' ? 'selected' : ''}"/>제목</option>
					<option value="c"><c:out value="${STLP.searchType eq 'c' ? 'selected' : ''}"/>내용</option>
					<option value="w"><c:out value="${STLP.searchType eq 'w' ? 'selected' : ''}"/>작성자</option>
				</select> 
				<input type="text" name="keyword" id="keywordInput" value="${STLP.keyword}" required=""/>
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
function loginChk(user_no){
	if(user_no == null){
		alert('로그인 하셔야 작성이 가능합니다');
	}else{
		location.href='qna.do';
	}
}


$(function() {
	$('#searchBtn').click(
			function() {
				self.location = "qnalist.do"
						+ '${pageMaker.makeQuery(1)}' + "&searchType="
						+ $("select option:selected").val()
						+ "&keyword="
						+ encodeURIComponent($('#keywordInput').val());
			});
});

</script>

</html>