<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
		<div class="main-all-box">
			<div class="top-box-content">
			<form action="qnaupdateResult.do" method="post">
			<input type="hidden" name="qna_no" value="${dto.qna_no }">
			<%-- <input type="hidden" name="user_id" value="${login.getUser_id()}" readonly> --%>
					<div class="top-box-content">
						<div class="title-text">
							<h2>상세보기</h2>
						</div>
					</div>
						<div class="box-body"></div>
						<div class="form-group">
							<label>카테고리</label>
							<input type="radio" name="qna_type" id="qna_type" value="${dto.qna_type }">신고
							<input type="radio" name="qna_type" id="qna_type" value="${dto.qna_type }">일반문의
						</div>
						<div class="form-group">
							<label>작성자</label>
							<label  class="detail-qna-writer" style="font-weight:bold;">
							<input type="text" name="user_id" placeholder="${dto.user_id }" value="${dto.user_id }" readonly="readonly" required>
							</label>
						</div>
						<div class="form-group">
							<label>제목</label>
							<label class="detail-qna-title" style="font-weight:bold;">
							<input type="text" id="qna_title" name="qna_title" value="${dto.qna_title }">
							</label>
					
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="qna_content" id="qna_content" class="detail-qna-content" style="font-weight:bold;">${dto.qna_content }</textarea>

						</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="location.href='qnalist.do'">
						<input id="pointer" type="submit" value="수정">
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>