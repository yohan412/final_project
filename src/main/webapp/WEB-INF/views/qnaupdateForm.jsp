<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/boarddetail.css">
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section>
		<div class="main-all-box">
			<form action="qnaupdateResult.do" method="post">
			<input type="hidden" name="qna_no" value="${dto.qna_no }">
			<input type="hidden" name="qna_gpno" value="${dto.qna_gpno }">
			<%-- <input type="hidden" name="user_id" value="${login.getUser_id()}" readonly> --%>
					<div class="top-box-content">
						<div class="title-text">
							<h2>Q&A 수정</h2>
						</div>
					</div>
					<div class="box-body">
						<div class="type-form">
							<h4>카테고리</h4>
							<input type="radio" name="qna_type" id="qna_type" value="${dto.qna_type }">신고
							<input type="radio" name="qna_type" id="qna_type" value="${dto.qna_type }">일반문의
						</div>
						<div class="writer-form">
							<h4>작성자</h4>
							<label  class="detail-qna-writer" style="font-weight:bold;">
							<input type="text" name="user_id" placeholder="${dto.user_id }" value="${dto.user_id }" readonly="readonly" required>
							</label>
						</div>
						<div class="title-form">
							<h4>제목</h4>
							<label class="detail-qna-title" style="font-weight:bold;">
							<input type="text" id="qna_title" name="qna_title" value="${dto.qna_title }">
							</label>
					
						</div>
						<div class="content-form">
							<h4>내용</h4>
							<textarea name="qna_content" id="qna_content" class="detail-qna-content" style="border: 1px solid;">${dto.qna_content }</textarea>

						</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="location.href='qnalist.do'">
						<input id="pointer" type="submit" value="수정">
					</div>
				</div>
				</form>
			</div>

	</section>
</body>
</html>