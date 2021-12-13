<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link href='<c:url value="/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/boardTest.css"/>' rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ BOARD</title>
<h1>header</h1>
</head>
<body>
<h1>Q&A 게시판</h1>
<br>
<div id="mainform">
<div id="board_list">
	<div id="boardselect_form">
	<div id="board_list">
		<div id="boardselect_form">
			<div class="boardselect">
				<p id="faqboard" class="faqboard"
					onclick="location.href='faqboard.jsp'">faq</p>
			</div>
			<div class="boardselect">
				<p id="qnaboard" class="qnaboard"
					onclick="location.href='qnaboard.jsp'">q&a</p>
			</div>
		</div>
	</div>
	</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="board_list_head">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
					<div class="view">조회</div>
				</div>
				<div class="board_list_body">
					<div class="item">
						<div class="num">5</div>
						<div class="title">
							<a href="#">회원 가입 문의 합니다.</a>
						</div>
						<div class="writer">user5</div>
						<div class="date">2021-12-08</div>
						<div class="view">200</div>
					</div>
					<div class="item">
						<div class="num">4</div>
						<div class="title">
							<a href="#">경기 일정은 어떻게 잡나요?</a>
						</div>
						<div class="writer">user4</div>
						<div class="date">2021-12-07</div>
						<div class="view">100</div>
					</div>
					<div class="item">
						<div class="num">3</div>
						<div class="title">
							<a href="#">후기 문의 합니다.</a>
						</div>
						<div class="writer">user3</div>
						<div class="date">2021-12-04</div>
						<div class="view">50</div>
					</div>
					<div class="item">
						<div class="num">2</div>
						<div class="title">
							<a href="#">고객센터 문의 합니다.</a>
						</div>
						<div class="writer">user2</div>
						<div class="date">2021-12-03</div>
						<div class="view">160</div>
					</div>
					<div class="item">
						<div class="num">1</div>
						<div class="title">
							<a href="#">용병 등록은 어떻게 하나요?</a>
						</div>
						<div class="writer">user1</div>
						<div class="date">2021-12-01</div>
						<div class="view">300</div>
					</div>
				</div>
			</div>
		</div>
		</div>
			<div id="serchform">
            <div>
                <input type="text" name="serch" id="search">
                <input type="button" id="button" value="검색">
            </div>
		<div class="paging">
			<a href="#" class="bt first">처음 페이지</a> <a href="#" class="bt prev">이전
				페이지</a> <a href="#" class="num">1</a> <a href="#" class="num">2</a> <a
				href="#" class="num">3</a> <a href="#" class="bt next">다음 페이지</a> <a
				href="#" class="bt last">마지막 페이지</a>
		</div>
</div>
<footer><h1>footer</h1></footer>		
</body>

</html>