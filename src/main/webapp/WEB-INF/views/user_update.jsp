<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<div style="text-align: center; margin-top: 30px;">	
		<h1>내 정보 관리</h1>
	</div>
	<div class="user_update">
		<form action="updateres.do" method="post">
			<input type="hidden" name="user_id" value="${login.user_id }">
			<table align="center" method="post" cellpadding="5">
				<tr>
					<th>아이디</th>
					<td>${login.user_id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${login.user_name }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${login.user_gender }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${login.user_birthdate }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" size="30" name="user_email" value="${login.user_email }"></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><input type="text" name="user_phone" size="15" value="${login.user_phone }"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${login.user_zip }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${login.user_addr }</td>
				</tr>
				<tr>
					<td colspan="10" style="text-align: right;">
						<input type="submit" value="완료">
						<input type="button" value="취소" onclick="location.href='user_info.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>