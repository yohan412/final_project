<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	*{
    margin: 0; padding: 0; box-sizing: border-box;
}
body{
    font-family: 'Noto Sans KR', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;}
img{
    text-align: center;
    margin-left: 120px;
}
.login-form{
    position: relative; z-index: 2;
}
.int-area{
   width: 400px; position: relative;
   margin-top: 20px;
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
    margin-top: 20px;
    text-align: center ;
}
.caption{
    font-size: 15px;
    text-decoration: none;
}
.kakao-login{
    margin-top: 15px;
    cursor: pointer;
    position: relative;
    right: 60px;
}
.naver-login{
    margin-top: 15px;
    cursor: pointer;
    position: relative;
    right: 60px;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	Kakao.init('0489eca4932b8ea38718d86e8712239a'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }
	
</script>
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
            <img src="img/bg1.jpg">
            <div class="int-area">
                <input type="text" name="id" id="user_id" required>
                <label for="id">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="user_pw" required>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                <input type="button" value="LOGIN" onclick="login();">
            </div>
            <div class="btn-area">
                <input type="button" value="SIGNUP" onclick="location.href='registerform.do'">
            </div>
            <div id="loginChk"></div>
        	<div class="kakao-login">
            	<a href="javascript:void(0)"><img src="img/Kakao.png" onclick="kakaoLogin();"></a>
        	</div>
        	<div class="naver-login">
        	<div id="naver_id_login"></div>
            	<a href="javascript:void(0)"><img src="img/naver.png" onclick=""></a>
        	</div>
        	<div class="caption">
            	<a href="">Forgot Password?</a>
        	</div>
    </section>
</body>
</html>