<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href='<c:url value="/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/boardTest.css"/>' rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A BOARD</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		<form role="form" method="get">
			<div class="board_list_wrap">
				<div>
					<table style="width: 800px;" border="1">
						<thead>
							<tr>
								<th style="width: 10%;">번호</th>
								<th style="width: 10%;">작성자</th>
								<th style="width: 20%;">제목</th>
								<th style="width: 50%;">내용</th>
								<th style="width: 10%;">작성일</th>
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
							<tr>
								<td colspan="5" align="right"><input type="button"
									value="글 작성" onclick="location.href='qna.do'"></td>
							</tr>
						</tbody>
					</table>
					<div class="serch">
						<select name="searchType">
							<option value="n"><c:out value="${scri.searchType == null ? '검색' : ''}"/></option>
							<option value="t"><c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"><c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w"><c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc"><c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select> <input type="text" name="keyword" id="keywordInput"
							value="${scri.keyword}" />

						<button id="searchBtn" type="button">검색</button>

					</div>
				</div>
			</div>
		
		<!-- 페이지 리스트 -->
		<div class="page-list" align="center">

			<c:if test="${pageMaker.prev }">
				<a href="qnalist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
				var="idx">
				<a href="qnalist.do${pageMaker.makeSearch(idx) }">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<a href="qnalist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
			</c:if>

		</div>
		</form>
	</div>
	</section>

	<!-- footer -->

	<footer> footer </footer>
	<script type="text/javascript">
		$(function() {
			$('#searchBtn').click(
					function() {
						self.location = "qnalist.do" + '${pageMaker.makeQuery(1)}' + 
						"&searchType=" + $("select option:selected").val() + 
						"&keyword=" + encodeURIComponent($('#keywordInput').val());
					});
		});
	</script>
</body>

</html>