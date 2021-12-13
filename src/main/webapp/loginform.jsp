<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.btn-area button{
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
.img-login{
    margin-top: 15px;
    cursor: pointer;
    position: relative;
    right: 60px;
}
</style>
</head>
<body>
	<section class="Login-form">
        <form action="">
            <img src="img/bg1.jpg">
            <div class="int-area">
                <input type="text" name="id" id="id" required>
                <label for="id">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw" required>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                <button type="submit">LOGIN</button>
            </div>
            <div class="btn-area">
                <button type="button">SIGN UP</button>
            </div>
        </form>
        <div class="img-login">
            <img src="img/Kakao.png">
        </div>
        <div class="img-login">
            <img src="img/Naver.png">
        </div>
        <div class="caption">
            <a href="">Forgot Password?</a>
        </div>
    </section>
</body>
</html>