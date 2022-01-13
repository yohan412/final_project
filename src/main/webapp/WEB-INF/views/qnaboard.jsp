<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href='<c:url value="/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/boardTest.css"/>'
	rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A BOARD</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
table {
	
}
</style>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div>
		<h1>Q&A 게시판</h1>
	</div>
	<br>
	<div id="mainform">
		<div id="board_list">
			<div id="boardselect_form">
				<div id="board_list">
					<div id="boardselect_form">
						<div class="boardselect" id="faq">
							<p id="faqboard" class="faqboard"
								onclick="location.href='faqlist.do'">FAQ</p>
						</div>
						<div class="boardselect" id="qna">
							<p id="qnaboard" class="qnaboard"
								onclick="location.href='qnalist.do'">Q&A</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<section>
		<!-- list start -->
		<div class="list-all-box">

				<div class="board_list_wrap">
					<div>
						<table class="qna-table"
							style="text-align: center; inline-block; border: 1px solid #dddddd; width: 900px;"
							align="center">
							<colgroup>
								<col class="qna_no">
								<col class="qna_writer">
								<col class="qna_title">
								<col class="qna_content">
								<col class="qna_date">
							<thead>
								<tr>
									<th
										style="background-color: #eeeeee; text-align: center width: 10%;">번호</th>
									<th
										style="background-color: #eeeeee; text-align: center width: 10%;">작성자</th>
									<th
										style="background-color: #eeeeee; text-align: center width: 20%;">제목</th>
									<th
										style="background-color: #eeeeee; text-align: center width: 50%;">내용</th>
								<tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="5" align="center">-------- 작성된 글이 없습니다
												--------</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="dto">
											<tr>
												<td>${dto.qna_no }</td>
												<td>${dto.user_id}</td>
												<td><a href="qnadetail.do?qna_gpno=${dto.qna_gpno }">${dto.qna_title }</a></td>
												<td>${dto.qna_content }</td>
												<td>${dto.qna_reg }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<!-- 페이지 리스트 -->
						<div class="page-list" align="center">

							<c:if test="${pageMaker.prev }">
								<input type="button" id="prev-btn" onclick="location.href='qnalist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}'" value="<<">
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage }" var="idx">
								<a href="qnalist.do${pageMaker.makeSearch(idx) }">${idx}</a>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
								<input type="button" id="next-btn" onclick="location.href='qnalist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}'" value=">>">
							</c:if>

						</div>
						<div class="serch" align="center">
							<select name="searchType">
								<option value="n"><c:out value="${scri.searchType == null ? '검색' : ''}" /></option>
								<option value="t"><c:out value="${scri.searchType == 't' ? 'selected' : ''}" />>제목</option>
								<option value="c"><c:out value="${scri.searchType == 'c' ? 'selected' : ''}" />>내용</option>
								<option value="w"><c:out value="${scri.searchType == 'w' ? 'selected' : ''}" />>작성자</option>
								<option value="tc"><c:out value="${scri.searchType == 'tc' ? 'selected' : ''}" />>제목+내용</option>
							</select> 
							<input type="text" name="keyword" id="keywordInput" value="${STLP.keyword}" required=""/>
							<button id="searchBtn" type="button">검색</button>

						</div>
					</div>
				</div>

			<div class="content-submit-list" align="right">
				<input id="pointer" type="button" value="작성하기" style="margin-top: 15px;" onclick="loginChk(${login.user_no})">
			</div>
		</div>
	</section>

	<!-- footer -->

	<footer> footer </footer>
	<script type="text/javascript">
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
</body>
<footer>
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
</script>

</html>