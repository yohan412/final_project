<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href='<c:url value="/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/board.css"/>' rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ BOARD</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
	table{
	
	}
</style>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>

	<div>
		<h1>FAQ 게시판</h1>
	</div>
	<br>
	<div id="mainform">
		<div id="board_list">
			<div id="boardselect_form">
				<div id="board_list">
					<div id="boardselect_form">
						<div class="boardselect">
							<p id="faqboard" class="faqboard"
								onclick="location.href='/faqlist.do'">FAQ</p>
						</div>
						<div class="boardselect">
							<p id="qnaboard" class="qnaboard"
								onclick="location.href='/qnalist.do'">Q&A</p>
						</div>
					</div>
				</div>
			</div>
			<div id="board_middle_form">
				<div class="middle">
					<p id="newone" class="newone">최신순</p>
				</div>
			</div>

			<!-- list start -->
			<div class="board_list_wrap">
				<div>
					<table style="width: 800px;" border="1">
						<thead>
							<tr>
								<th style="width: 10%;">번호</th>
								<th style="width: 10%;">작성자</th>
								<th style="width: 20%;">문의 내용</th>
								<th style="width: 50%;">답변</th>
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
								<c:forEach items="${list }" var="faq_dto">
									<tr>
										<td>${faq_dto.faq_no }</td>
										<td>${faq_dto.user_id}</td>
										<td><a href="detail.do?faq_no=${faq_dto.faq_no }">${faq_dto.faq_title }</a></td>
										<td>${faq_dto.faq_content }</td>
										<td>${faq_dto.faq_reg }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
							<tr>
								<td colspan="5" align="right"><input type="button"
									value="글 작성" onclick=""></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
		<div></div>


		<div id="serchform">
			<div>
				<div id="ct" style="text-align: left; width: 100px; height: 40px;">
					<select style="display: inline-block;">
						<option>카테고리</option>
						<option>제목</option>
						<option>작성자</option>
					</select>
				</div>
				<input type="text" name="serch" id="search"> <input
					type="button" id="button" value="검색">
			</div>
		</div>
		<div class="paging">
			<a href="#" class="bt first">처음 페이지</a> <a href="#" class="bt prev">이전
				페이지</a> <a href="#" class="num">1</a> <a href="#" class="num">2</a> <a
				href="#" class="num">3</a> <a href="#" class="bt next">다음 페이지</a> <a
				href="#" class="bt last">마지막 페이지</a>
		</div>
		<!-- footer -->

		<footer> footer </footer>
	<script type="text/javascript">
			
	</script>
</body>

</html>