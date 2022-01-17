<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>QNA COMMENT 작성</title>

</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<section>
		<div class="main-all-box">
			<div class="main-top-box">
				<form action="qnaCommentres.do" method="post">
					<!-- 답글 작성 보내는 폼 -->
					<input type="hidden" name="qna_gpno" value="${qna_dto.qna_gpno }">
					<input type="hidden" name="qna_type" value="${qna_dto.qna_type }">
					<input type="hidden" name="qna_gpsq" value="${qna_dto.qna_gpsq }">
					<input type="hidden" name="qna_content" value="${qna_dto.qna_content }">
					<input type="hidden" name="user_id" value="${login.getUser_id()}" readonly>
					<div class="title-text">
						<h2>QNA 문의 답글 작성</h2>
					</div>
				<div class="box-body">
				<div class="box-top-comment">
						<h4>문의 내용</h4>
						<div class="type-form">
							<h4>카테고리</h4> 
							<label style="font-weight:bold; font-size: 15px; margin-left: 20px;">${qna_dto.qna_type }</label>
						</div>
						<div class="writer-form">
							<h4>작성자</h4> 
							<label style="font-weight:bold; font-size: 15px; margin-left: 20px;">${qna_dto.user_id }</label>
						</div>
						<div class="title-form">
							<h4>제목</h4> 
							<label style="font-weight:bold; font-size: 15px; margin-left: 20px;">${qna_dto.qna_title }</label>

						</div>
						<div class="content-form">
							<h4>내용</h4>
							<textarea style="margin-left: 20px;">${qna_dto.qna_content }</textarea>
						</div>
					</div>	
					<br>
					<div class="box-bottom">
						<div class="comment-form">
							<h2>문의 답변</h2>
						</div>

						<div class="comment-title">
						<h4>문의 답변</h4>
						<input style="margin-bottom: 10px; "type="text" name="qna_title" placeholder="제목을 입력해주세요.">
						</div>

						<div class="content-select-position">
						<h4>답변 내용</h4>
							<textarea style="border:1px solid" placeholder="답변 내용을 입력해주세요.."></textarea>
						</div>
	
						<div class="content-submit" align="right" style="border-bottom: none;">
							<button id="pointer" type="button" onclick="movedetail()">이전</button> 
							<button id="pointer" type="submit">작성완료</button>
						</div>
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
<script type="text/javascript">
	function movedetail(){
		location.href='qnadetail.do?qna_gpno='+${qna_dto.qna_gpno};
	}
</script>
</html>