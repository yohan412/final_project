<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style type="text/css">
html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	background: #f5f6f7;
}

h5 {
	text-align: center;
}

#wrapper {
	position: relative;
	height: 100%;
}

#content {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}

h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}



#USER_BIRTH DATE_wrap {
	display: table;
	width: 100%;
}

#bir_yy {
	display: table-cell;
	width: 147px;
}

#bir_mm {
	display: table-cell;
	width: 147px;
}

#bir_dd {
	display: table-cell;
	width: 147px;
}

#bir_mm, #bir_dd {
	padding-left: 2%;
}

#phone_wrap {
	display: table;
	width: 100%;
}

#phone_certification {
	display: table-cell;
	width: 70%;
}


select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
	background-size: 20px 8px;
}

.btn_area {
	margin: 30px 0 91px;
}
.button1 {
	background-color: gray;
	color: white;
	border: 3px solid white;
	padding: 18px 0 15px;
	font-size:13px;
	width: 100%;	
}
#button2 {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: white;
	background-color:rgb(75, 161, 231);
	font-size: 20px;
	font-weight: 200;
	border-radius: 10px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function pwchk(){
		var pw1 = document.getElementsByName("user_pw")[0].value;
		var pw2 = document.getElementsByName("user_pw2")[0].value;
		
		if(pw1!=pw2){
			alert("비밀번호 입력 오류");
			return false;
		}
			
		return true;
	}
</script>
</head>
<body>
	<header></header>
	<hr>
	<div id="wrapper">
		<h5>
			가입시 입력하셨던 전화번호를 작성해주세요. <br> 입력하신 전화번호로 인증번호를 발송해 드립니다.
		</h5>
		<div id="content">
		<form action="change_pw_input.do" method="post"  onsubmit="return pwchk()">
			<input type="hidden" name="user_id" value="${user_id }">	
			<div>
				<h3 class="join_title">
					<label for="USER_ID">새 비밀번호</label>
				</h3>
				<span class="box int_id">
				 	<input type="text" id="id" class="int" maxlength="100" name="user_pw" placeholder="새 비밀번호 입력">
				</span>
			</div>
			<div>
				<h3 class="join_title">
					<label for="USER_ID">새 비밀번호 확인</label>
				</h3>
				<span class="box int_id">
				 	<input type="text" id="id" class="int" maxlength="100" name="user_pw2" placeholder="새 비밀번호 확인">
				</span>
			</div>
				
			<br>
			<br>

			<div class="btn_area">
				<button type="submit" id="button2">
					<span>확인</span>
				</button>
				<br><br>
				<button type="button" onclick="index.do'" id="button2" style="background-color: gray;">
					<span>취소</span>
				</button>
			</div>
		</form>
		
	

		</div>

	</div>
	<hr>
	<footer></footer>
</body>
</html>