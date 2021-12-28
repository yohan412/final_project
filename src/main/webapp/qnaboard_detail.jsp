<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A BOARD DETAIL</title>
</head>
<body>
<header>
	<!-- <%@ include file="header.jsp" %> -->
</header>
<section>
	<h1>DETAIL</h1>
	
	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${dto.user_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.qna_title }</td>	
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea row="10" cols="60">${dto.qna_content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<input type="button" value="목록" onclick="location.href='qnalist.do'">
			<input type="button" value="수정" onclick="location.href='updateform.do?qna_no=${dto.qna_no}'">
			<input type="button" value="삭제" onclick="location.href='delete.do?qna_no=${dto.qna_no}'">
			</td>
		</tr>
	</table>
</section>
</body>
</html>