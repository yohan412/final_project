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
<title>Q&A BOARD</title>
</head>
<body>
<section>
	<div id="mainform">
		<div id="board_title"> 
			<h1>Q&A 게시판</h1>
		</div>
		<br>
			<div id="board_list">
				<div id="boardselect_form">
					<div class="boardselect">
						<p id="faqboard" class="faqboard" onclick="location.href='faqboard.jsp'">faq</p>
					</div>
					<div class="boardselect">
						<p id="qnaboard" class="qnaboard" onclick="location.href='qnaboard.jsp'">q&a</p>
					</div>
				</div>

				<c:forEach begin="1" end="5">
					<div class="list" onclick="locatcion.href='boarddetail'">
						<div id="no">1</div>
						<div id="title">문의 드립니다.</div>
						<div id="id">user1</div>
						<div id="date">
							<div id="date_info">2021-12-12</div>
						</div>
						<div id="answer">답변 완료</div>
					</div>		
				</c:forEach>
			</div>
			<div id="pagingform">
            <button id="prevbutton"><a href="#"><</a></button>
            <c:forEach begin="1" end="5">
                <button id="pagingnum"><a href="#">1</a></button>
            </c:forEach>
            <button id="nextbutton"><a href="#">></a></button>
        </div>
			<div id="serchform">
            <div>
                <input type="text" name="serch" id="search">
                <input type="button" id="button" value="검색">
            </div>
        </div>
	</div>
</section>	
</body>
</html>