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
	<form action="faqinsert.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
            <input type="hidden" name="user_id" value="${login.getUser_id()}" readonly>
			<div class="top-box-content">
				<div class="title-text">	
					<h2>FAQ</h2>
				</div>
			</div>
			<div class="box-body">
				<div class="box-top">
					<div class="content-select-foot">
						<h4>카테고리</h4>
						<input type="radio" name="faq_type" value="신고">신고
						<input type="radio" name="faq_type" value="일반문의">일반문의
					</div>
					<div>
						<h4>문의 내용</h4>
						<input type="text" name="faq_title" placeholder="제목을 입력해주세요">
					</div>
					<div class="content-select-position">
						<h4>답변 내용</h4>
						<textarea name="faq_content" placeholder="문의 내용을 입력해주세요."></textarea>
					</div>
		<div class="button-form" style="border-bottom: none;">
			<div class="content-submit" align="right">
				<button id="pointer" type="button" onclick="location.href='faqlist.do'">이전</button>
				<button id="pointer" type="submit" >작성완료</button>
			</div>
		</div>
			</div>
		</div>
	</form>
</div>

</section>
</body>
<footer>
	<%@ include file="footer.jsp" %>
</footer>

</html>