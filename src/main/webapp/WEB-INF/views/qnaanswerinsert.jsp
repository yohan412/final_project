<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/boarddetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>QNA댓글작성</title>

</head>
<body>
<header>
	<%-- <%@ include file="header.jsp" %> --%>
</header>
<section>
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="qnaanswerinsert.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
            	<input type="hidden" name="user_id" value="${login.getUser_id()}" readonly>
				
				<div class="top-box-content">
					<div class="title-text">	
						<h2>QNA</h2>
					</div>
					<hr>
					<div class="content-select-foot">
						<input type="radio" name="qna_answer_type" value="답글">답글
						
						<input type="text" name="qna_answer_title" placeholder="제목을 입력해주세요">
					</div>
					<hr>
					<div class="content-select-position">
						<textarea row="10" cols="60" name="qna_answer_content" placeholder="답글을 작성하세요."></textarea>
					</div>
					<hr>

					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="이전" onclick="location.href='qnalist.do'">
						<input id="pointer" type="submit" value="작성완료">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<footer>
	<%@ include file="footer.jsp" %>
</footer>
</body>

</html>