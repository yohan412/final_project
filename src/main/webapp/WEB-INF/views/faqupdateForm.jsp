<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/boarddetail.css">
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
    </style>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section>
		<div class="main-all-box">
			<form action="faqupdateResult.do" method="post">
			<input type="hidden" name="faq_no" value="${dto.faq_no }">
					<div class="top-box-content">
						<div class="title-text">
							<h2>FAQ 수정</h2>
						</div>
					</div>
					<div class="box-body">
						<div class="type-form">
							<h4>카테고리</h4>
							<input type="radio" name="faq_type" id="faq_type" value="${dto.faq_type }">신고
							<input type="radio" name="faq_type" id="faq_type" value="${dto.faq_type }">일반문의
						</div>
						<div class="writer-form">
							<h4>작성자</h4>
							<label  class="detail-faq-writer" style="font-weight:bold;">
							<input type="text" name="user_id" placeholder="${dto.user_id }" value="${dto.user_id }" readonly="readonly" required>
							</label>
						</div>
						<div class="title-form">
							<h4>문의 내용</h4>
							<label class="detail-faq-title" style="font-weight:bold;">
							<input type="text" id="faq_title" name="faq_title" value="${dto.faq_title }">
							</label>
					
						</div>
						<div class="content-form">
							<h4>답변 내용</h4>
							<textarea name="faq_content" id="faq_content" class="detail-faq-content" style="border: 1px solid;">${dto.faq_content }</textarea>

						</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="location.href='faqlist.do'">
						<input id="pointer" type="submit" value="수정">
					</div>
				</div>
				</form>
			</div>

	</section>
</body>
	<footer style="align-content: center;">
	<%@ include file="footer.jsp"%>
</footer>
</html>