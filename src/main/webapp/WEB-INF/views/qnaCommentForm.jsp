<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/qna.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>QNA COMMENT 작성</title>

</head>
<body>
	<header>
		<%-- <%@ include file="header.jsp" %> --%>
	</header>
	<section>
		<div class="main-all-box">
			<div class="main-top-box">
				<form action="qnaCommentres.do" method="post">
					<!-- 답글 작성 보내는 폼 -->
					<input type="hidden" name="qna_gpno" value="${qna_dto.qna_gpno }">
					<input type="hidden" name="qna_type" value="${qna_dto.qna_type }">
					<input type="hidden" name="qna_gpsq" value="${qna_dto.qna_gpsq }">
					<input type="hidden" name="user_id" value="${login.getUser_id()}" readonly>

					<div class="top-box-content">
						<div class="title-text">
							<h2>QNA 문의 답글</h2>
						</div>
						<hr>
						<div>
							<h2>문의 내용</h2>
							<div class="box-body"></div>
							<div class="form-group">
								<label>카테고리</label> <label class="detail-qna-cartagory" style="font-weight: bold;">${qna_dto.qna_type }</label>
							</div>
							<div class="form-group">
								<label>작성자</label> <label class="detail-qna-writer" style="font-weight: bold;">${qna_dto.user_id }</label>
							</div>
							<div class="form-group">
								<label>제목</label> <label class="detail-qna-title" style="font-weight: bold;">${qna_dto.qna_title }</label>

							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea class="detail-qna-content" style="font-weight: bold;">${qna_dto.qna_content }</textarea>

							</div>
						</div>
						<br>
						<br>
						<br>
						<div class="content-select-type">
							<label>답글</label>
						</div>
						<hr>
						<div class="comment-title">
						<input type="text" name="qna_title" placeholder="제목을 입력해주세요.">
						</div>
						<hr>
						<div class="content-select-position">
							<textarea row="10" cols="60" name="qna_content" placeholder="답변 내용을 입력해주세요.."></textarea>
						</div>
						<hr>
						<div class="content-submit" align="right">
							<input id="pointer" type="button" value="이전"
								onclick="location.href='qnadetail.do'"> <input
								id="pointer" type="submit" value="작성완료">
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