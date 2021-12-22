<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link href='<c:url value="/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/board.css"/>' rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ BOARD</title>
</head>
<body>
<!-- header -->
<header>
header
</header>

<div><h1>FAQ 게시판</h1></div>
<br>
<div id="mainform">
<div id="board_list">
	<div id="boardselect_form">
	<div id="board_list">
		<div id="boardselect_form">
			<div class="boardselect">
				<p id="faqboard" class="faqboard"
					onclick="location.href='/fnalist.do'">faq</p>
			</div>
			<div class="boardselect">
				<p id="qnaboard" class="qnaboard"
					onclick="location.href='/qnalist.do'">q&a</p>
			</div>
		</div>
	</div>
	</div>
		<div id="board_middle_form">
			<div class="middle">
			<p id="newone" class="newone">최신순</p>
			</div>
			<div class="middle">
				<input id="write" type="button" value="글등록" onclick="">
			</div>
		</div>
	
		<div class="board_list_wrap">


			<div class="board_list">
				<div class="board_list_head">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
					
				</div>
				<div class="board_list_body">
					<div class="item">
						<div class="num">5</div>
						<div class="title">
							<a href="#">회원 가입 문의 합니다.</a>
						</div>
						<div class="writer">user5</div>
						<div class="date">2021-12-08</div>
						
					</div>
					<div class="item">
						<div class="num">4</div>
						<div class="title">
							<a href="#">경기 일정은 어떻게 잡나요?</a>
						</div>
						<div class="writer">user4</div>
						<div class="date">2021-12-07</div>
						
					</div>
					<div class="item">
						<div class="num">3</div>
						<div class="title">
							<a href="#">후기 문의 합니다.</a>
						</div>
						<div class="writer">user3</div>
						<div class="date">2021-12-04</div>
						
					</div>
					<div class="item">
						<div class="num">2</div>
						<div class="title">
							<a href="#">고객센터 문의 합니다.</a>
						</div>
						<div class="writer">user2</div>
						<div class="date">2021-12-03</div>
						
					</div>
					<div class="item">
						<div class="num">1</div>
						<div class="title">
							<a href="#">용병 등록은 어떻게 하나요?</a>
						</div>
						<div class="writer">user1</div>
						<div class="date">2021-12-01</div>
						
					</div>
				</div>
			</div>
		</div>
		</div>
			<div>

			</div>
			

			<div id="serchform">
			<div>
				<div id="ct" style="text-align: left; width: 100px; height: 40px;">
				<select style="display: inline-block;">
					<option>카테고리</option>
					<option>제목</option>
					<option>작성자</option>
				</select>
				</div>
                <input type="text" name="serch" id="search">
                <input type="button" id="button" value="검색">
            </div>
			</div>
		<div class="paging">
			<a href="#" class="bt first">처음 페이지</a> <a href="#" class="bt prev">이전
				페이지</a> <a href="#" class="num">1</a> <a href="#" class="num">2</a> <a
				href="#" class="num">3</a> <a href="#" class="bt next">다음 페이지</a> <a
				href="#" class="bt last">마지막 페이지</a>
		</div>
		<!-- footer -->
	
	<footer>
	footer
	</footer>
	
</body>

</html>