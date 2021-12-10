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
<title>Q&A BOARD</title>
</head>
<body>
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
					<div  class="num">5</div>
					<div class="title"><a href="#">회원 가입 문의 합니다.</a></div>
					<div class="writer">user5</div>
					<div class="date">2021-12-08</div>
					<div class="view">200</div>
				</div>
				<div class="item">
					<div class="num">4</div>
					<div class="title"><a href="#">경기 일정은 어떻게 잡나요?</a></div>
					<div class="writer">user4</div>
					<div class="date">2021-12-07</div>
					<div class="view">100</div>
				</div>			
				<div class="item">
					<div class="num">3</div>
					<div class="title"><a href="#">후기 문의 합니다.</a></div>
					<div class="writer">user3</div>
					<div class="date">2021-12-04</div>
					<div class="view">50</div>
				</div>			
				<div class="item">
					<div class="num">2</div>
					<div class="title"><a href="#">고객센터 문의 합니다.</a></div>
					<div class="writer">user2</div>
					<div class="date">2021-12-03</div>
					<div class="view">160</div>
				</div>			
				<div class="item">
					<div class="num">1</div>
					<div class="title"><a href="#">용병 등록은 어떻게 하나요?</a></div>
					<div class="writer">user1</div>
					<div class="date">2021-12-01</div>
					<div class="view">300</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>