<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section>
		<div class="main-all-box">
			<div class="top-box-content">
			<form action="faqupdateResult.do" method="post">
			<input type="hidden" name="faq_no" value="${dto.faq_no }">
			<%-- <input type="hidden" name="user_id" value="${login.getUser_id()}" readonly> --%>
					<div class="top-box-content">
						<div class="title-text">
							<h2>상세보기</h2>
						</div>
					</div>
						<div class="box-body"></div>
						<div class="form-group">
							<label>작성자</label>
							<label  class="detail-faq-writer" style="font-weight:bold;">
							<input type="text" name="user_id" placeholder="${dto.user_id }" value="${dto.user_id }" readonly="readonly" required>
							</label>
						</div>
						<div class="form-group">
							<label>제목</label>
							<label class="detail-faq-title" style="font-weight:bold;">
							<input type="text" id="faq_title" name="faq_title" value="${dto.faq_title }">
							</label>
					
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="faq_content" id="faq_content" class="detail-faq-content" style="font-weight:bold;">${dto.faq_content }</textarea>

						</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="location.href='faqlist.do'">
						<input id="pointer" type="submit" value="수정">
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>