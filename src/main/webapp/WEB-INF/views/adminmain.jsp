<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div style="text-align: center; margin-top: 30px;">	
		<h1>회원 목록</h1>
	</div>
	<div class="memberlist" align="center">
		<table border="1" width="800px;">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>등급</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="5" align="center">------ 저장된 회원정보가 없습니다 ------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="aDto">
						<tr>
							<td>${aDto.user_no }</td>
							<td><a href="admindetail.do?user_id=${aDto.user_id }">${aDto.user_id }</a></td>
							<td>${aDto.user_name }</td>
							<td>${aDto.user_email }</td>
							<td>${aDto.user_phone }</td>
							<td>${aDto.user_role }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>





















</section>
</body>
</html>