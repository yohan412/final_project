<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url('https://webfontworld.github.io/nexen/NexenTire.css');
	*{
    margin: 0; padding: 0; box-sizing: border-box;
}
body{
	background-image: url("/img/soccerwallpaper.jpg");
  	background-attachment: fixed;
	background-repeat: no-repeat
    font-family: 'Noto Sans KR', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    }
    section{
    	background-color: white;
    	border: solid black 1px;
    	border-radius: 1em;
    	width: 500px;
    	height: 700px;
    	align-items: center;
    	text-align: center;
    }
img{
	
}
.login-form{
    position: relative; z-index: 2;
}
.int-area{
   width: 350px; 
   position: relative;
   margin: 7px;
   display: inline-block;
}
.int-area input{
    width: 100%; 
    padding: 20px 10px 10px;
    background-color: transparent;
    border: none;
    border-bottom: 1px solid #999;
    font-size: 18px; 
    outline: none;    
}
.int-area label{
    position: absolute; left: 10px; top: 15px; 
    font-size: 15px; color: gray;
    transition: all .5s ease;
}
.int-area input:focus + label,
.int-area input:valid + label{
    top: -2px;
    font-size: 13px; color: #166cea; 
}
.btn-area{
    margin-top: 20px;
    width: 400px;
    display: inline-block;
}
.btn-area input{
    width: 100%; height: 50px; 
    background: #166cea;
    color: #fff;
    font-size: 15px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
}
.caption{
    text-align: center ;
    margin: 10px;
}
.caption{
    font-size: 15px;
    text-decoration: none;
}
.kakao-login{
    margin-top: 15px;
    cursor: pointer;
    position: relative;
}
.naver-login{
    margin-top: 15px;
    cursor: pointer;
    position: relative;
}
/*===================================================*/
	.outline-button {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  background-color: transparent;
  border: none;
  box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.3) inset;
  color: black;
  margin: auto;
  padding: 0rem 6rem;
  position: relative;
  cursor: pointer;
      width: 270px;
    height: 60px;
    font-family: 'NexenTire';
    color: navy;
    font-size: 20px;
    font-weight: bold;
}
.outline-button::before, .outline-button::after {
  content: "";
  position: absolute;
  height: 0;
  width: 2px;
  transition: height 0.4s 0.4s cubic-bezier(0.86, 0, 0.07, 1), width 0.4s cubic-bezier(0.86, 0, 0.07, 1);
}
.outline-button::before {
  box-shadow: 2px 2px 0 navy inset;
  bottom: 0;
  left: 0;
}
.outline-button::after {
  box-shadow: -2px -2px 0 navy inset;
  top: 0;
  right: 0;
}
.outline-button:hover::before, .outline-button:hover::after {
  height: 100%;
  width: 100%;
  transition: height 0.4s cubic-bezier(0.86, 0, 0.07, 1), width 0.4s 0.4s cubic-bezier(0.86, 0, 0.07, 1);
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	$("#loginChk").hide();	
});

function login(){
	var user_id = $("#user_id").val().trim();
	var user_pw = $("#user_pw").val().trim();
	var loginVal = {
			"user_id":user_id,
			"user_pw":user_pw
	};
	
	if(user_id == null || user_id == "" || user_pw == null || user_pw == ""){
		alert("ID 및 PW를 확인해 주세요");
	}else{
		$.ajax({
			type:"post",
			url:"ajaxlogin.do",
			data:JSON.stringify(loginVal),
			contentType:"application/json",
			dataType:"json",
			success:function(msg){
				if(msg.check==true){
					location.href="index.jsp";
				}else{
					$("#loginChk").show();
					$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
				}
			},
			error:function(){
				alert("통신 실패");
			}
		});
	}
}

</script>

</head>
<body>
	<section class="Login-form">
	            <a href="index.jsp"><img src="img/bg1.jpg" ></a>
	            <div class="int-area">
	                <input type="text" name="id" id="user_id" required>
	                <label for="id">USER NAME</label>
	            </div>
	            <div class="int-area">
	                <input type="password" name="pw" id="user_pw" required>
	                <label for="pw">PASSWORD</label>
	            </div>
	            <div class="btn-area">
	                <button class="outline-button" onclick="login();">로그인</button>
	            </div>
	            <div class="btn-area">
	                <button class="outline-button" onclick="location.href='registerform.do'">회원가입</button>
	            </div>
	            <div id="loginChk"></div>
	        	<div class="kakao-login">
	            	<a href="https://kauth.kakao.com/oauth/authorize?client_id=f4d035894dc919ed84747c27124adccc&redirect_uri=http://localhost:8787/kakaoLogin.do&response_type=code">
	            	<img src="img/Kakao.png"></a>
	        	</div>
	        	<div class="naver-login">
		        	<div id="naver_id_login">
		            	<a id="naverIdLogin_loginButton" href="${naverUrl }"><img src="img/Naver.png" onclick=""></a>
		        	</div>
		        </div>
	        	<div class="caption">
	            	<a href="find_id_form.do">아이디 찾기</a><br>
	            	<a href="change_pw_form.do">비밀번호 찾기</a><br>
	        	</div>
    </section>
</body>
</html>