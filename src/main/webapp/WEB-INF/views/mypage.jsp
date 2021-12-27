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
<header style="text-align:center; margin-top:20px;">
	헤더
</header>
<br><br><hr>
<section>
	<div style="text-align: center; margin-top: 30px;">	
		<h1>내 정보 관리</h1>
	</div>
	<div class="user_info">
		<form action="" method="post">
			<table align="center" method="post" cellpadding="5">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="userId" value="${dto.user_id }" style="width:300px;"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="name" name="userName" value="${dto.user_name }" style="width:300px;"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="text" id="gender" name="userGender" value="${dto.user_gender }" style="width:300px;"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" id="date" name="Date" value="${dto.user_birthdate }" style="width:300px;"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" name="Email" value="${dto.user_email }" style="width:300px;"></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><input type="text" id="phone" name="Phone" value="${dto.user_phone }" style="width:300px;"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" id="zip" name="Zip" value="${dto.user_zip }" style="width:100px;"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="addr" name="Addr" value="${dto.user_addr }" style="width:300px;"></td>
				</tr>
				<tr>
					<td colspan="10" style="text-align: right;">
						<input type="button" value="수정" onclick="">
						<input type="button" value="회원탈퇴" onclick="">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>
<hr><br><br>
<footer style="text-align:center;">푸터</footer>
</body>
</html>