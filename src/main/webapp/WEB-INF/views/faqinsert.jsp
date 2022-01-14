<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/boarddetail.css">
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>FAQ 작성</title>

</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section>
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="faqinsert.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
            	<input type="hidden" name="user_id" value="${login.getUser_id()}" readonly>
				
				<div class="top-box-content">
					<div class="title-text">	
						<h2>FAQ</h2>
					</div>
					<hr>
					<div class="content-select-foot">
						<input type="radio" name="faq_type" value="신고">신고
						<input type="radio" name="faq_type" value="일반문의">일반문의
						
						<input type="text" name="faq_title" placeholder="문의 질문">
					</div>
					<hr>
					<div class="content-select-position">
						<textarea row="10" cols="60" name="faq_content" placeholder="문의 내용."></textarea>
						
					</div>
					<hr>

					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="이전" onclick="location.href='faqlist.do'">
						<input id="pointer" type="submit" value="작성완료">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<footer>
	<%-- <%@ include file="footer.jsp" %> --%>
</footer>
</body>

</html>