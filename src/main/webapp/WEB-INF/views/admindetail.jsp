<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th, td{
	dispaly: inline-block;
	font-size: 0.8rem;
}
td input[type="text"]{
	width: 350px; height:50px;
	border: 1px solid #d1d1d1;
}
th{
    margin: 10px 0 8px;
   	font-size: 1.0rem;
   	font-weight: 400;
    text-align: left;
}	
td input[type="button"]{ 
   	background-color:rgb(75, 161, 231);
   	border: 1px solid gray;
    cursor: pointer;
    width: 100px; height: 30px;
}
table.type04 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
table.type04 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  font-size: 15px;
}
</style>
</head>
<body>
<section>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div style="text-align: center; margin-top: 30px;">	
		<h1>회원 정보</h1>
	</div>
	<div class="user_info" align="center">
			<table class="type04" align="center" method="post" cellpadding="5">
				<tr>
					<th>아이디</th>
					<td>${aDto.user_id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${aDto.user_name }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${aDto.user_gender }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${aDto.user_birthdate }</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>${aDto.user_role }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${aDto.user_email }</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${aDto.user_phone }</td>
				</tr>
				<tr>
					<th>우편번호</th> 
					<td>${aDto.user_zip }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${aDto.user_addr }</td>
				</tr>
				<tr>
					<td colspan="10" style="text-align: right;">
						<input type="button" value="수정" onclick="location.href='aupdateform.do?user_id=${aDto.user_id}'">
						<input type="button" value="회원탈퇴" onclick="location.href='adelete.do?user_id=${aDto.user_id}'">
					</td>
				</tr>
			</table>
	</div>
	<footer>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer>
</section>
</body>
</html>