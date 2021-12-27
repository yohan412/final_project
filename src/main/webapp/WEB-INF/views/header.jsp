<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	html {
	  height:100%;
	}
	
	header{
		height: 200px;
	}
	
	.menu {
	  width: 100%;
	  mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #ffffff 25%, #ffffff 75%, rgba(255, 255, 255, 0) 100%);
	  margin: 0 auto;
	  padding: 30px 0;
	}
	
	.menu ul {
	  text-align: center;
	  background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.2) 25%, rgba(255, 255, 255, 0.2) 75%, rgba(255, 255, 255, 0) 100%);
	  box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
	}
	
	.menu ul li {
	  display: inline-block;
	}
	
	.menu ul li a {
	  padding: 18px;
	  font-family: "Open Sans";
	  text-transform:uppercase;
	  color: rgba(0, 35, 122, 0.5);
	  font-size: 18px;
	  text-decoration: none;
	  display: block;
	}
	
	.menu ul li a:hover {
	  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
	  background: rgba(255, 255, 255, 0.1);
	  color: rgba(0, 35, 122, 0.7);
	}
		
</style>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<header>
	<div class="headr-all">
		<section>
			<div class="site-name" align="center">
				<h1 style="font-size: 40px;">Street Futsal Manager</h1>
			</div>
		</section>
		<nav class="menu">
		  	<ul>
		  		  <li>
		  	 		   <a href="#">Home</a>
		  	 	 </li>
		 	 	 <li>
		    	 	  <a href="gamelist.do">Game</a>
		   	  	 </li>
		 	 	 <li>
			    	  <a href="#">Stadium</a>
			  	 </li>
			 	 <li>
			    	  <a href="teamlist.do">Team</a>
			 	 </li>
			 	 <li>
			    	  <a href="mercenary.do">Mercenary</a>
			 	 </li>
			 	 <li>
			    	  <a href="qnalist.do">QnA</a>
			 	 </li>
			 	 <li>
					  <!-- 로그인 하지 않은 상태 -->
					  <c:if test="${login == null }">
					  	<a href="loginform.do">로그인</a>
					  </c:if>
				 </li>
				 <li>
				 	  <c:if test="${login == null }">
					  	<a href="registerform.do">회원가입</a>
					  </c:if>
				 </li>
				 <li>
					  <!-- 로그인한 상태 -->
			 	 	  <c:if test="${login != null }">
					  	<a href="logout.do">로그아웃</a>
					  </c:if>
			 	 </li>
			 	 <li>
					  <c:if test="${login != null }">
					  	<span>${login.user_name }님</span>
					  </c:if>
			 	 </li>
			 	 <li>
			 	 	  <c:if test="${login != null }">
			 	 	  	<a href="mypage.do">마이페이지</a>
			 	 	  </c:if>
			 	 </li>
			 	 <li>
			 	 	  <span sec:authentication="user_id"></span>
			 	 </li>
		 	 </ul>
		</nav>
	</div>
</header>
</body>
</html>