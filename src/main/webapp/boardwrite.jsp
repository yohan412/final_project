<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardwrite</title>
    <link href='<c:url value="${path}/resources/css/body.css"/>' rel="stylesheet">
</head>
<header><h1>header</h1></header>>
<body>
	<form action="" method="post">
		제목 : <input type="text" name="title" placeholder="제목" />
		<br/>
		글쓴이 : <input type="text" name="writer" placeholder="작성자"  />
		<br/>
		비밀번호 : <input type="password" name="pw" placeholder="비밀번호" />
		<br/>
		내용
		<br/>
		<textarea name="contents" rows="5" cols="50" ></textarea>
		<br/>
		<input type="submit" value="등록">&nbsp;
		<input type="reset" value="취소" onclick="">
	</form>
	<footer><h1>footer</h1></footer>	
</body>
</html>