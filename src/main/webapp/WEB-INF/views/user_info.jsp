<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이페이지</title>
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
</style>
<script type="text/javascript">
	function updateuser(userno){
		location.href="logincontroller.jsp?command=updateform&userno="+userno;
	}
	function deleteuser(userno){
		var returnValue = confirm("정말로 탈퇴하시겠습니까?");
		if(returnValue == true){
			location.href="logincontroller.jsp?command=deleteuser&userno="+userno;
		}
	}
</script>
</head>
<body>
<section>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div style="text-align: center; margin-top: 30px;">	
		<h1>내 정보 관리</h1>
	</div>
	<div class="user_info">
			<table align="center" method="post" cellpadding="5">
				<tr>
					<th>아이디</th>
					<td>${dto.user_id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.user_name }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${dto.user_gender }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${dto.user_birthdate }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.user_email }</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${dto.user_phone }</td>
				</tr>
				<tr>
					<th>우편번호</th> 
					<td>${dto.user_zip }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${dto.user_addr }</td>
				</tr>
				<tr>
					<td colspan="10" style="text-align: right;">
						<input type="button" value="수정" onclick="location.href='updateform.do?user_id=${dto.user_id}'">
						<input type="button" value="회원탈퇴" onclick="">
					</td>
				</tr>
			</table>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</section>
</body>
</html>