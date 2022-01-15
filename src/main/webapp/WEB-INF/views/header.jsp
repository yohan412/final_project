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
		top:0;
		height: 130px;
	}
	
	.menu {
	  width: 100%;
	  mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #ffffff 25%, #ffffff 75%, rgba(255, 255, 255, 0) 100%);
	  margin: 0 auto;
	  padding: 10px 0;
	}
	
	#menu_bar {
	  text-align: center;
	  background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.2) 25%, rgba(255, 255, 255, 0.2) 75%, rgba(255, 255, 255, 0) 100%);
	  box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
	}
	
	#menu_bar li {
	  display: inline-block;
	}
	
	#menu_bar li a {
	  padding: 18px;
	  font-family: "Open Sans";
	  text-transform:uppercase;
	  color: rgba(0, 35, 122, 0.5);
	  font-size: 18px;
	  text-decoration: none;
	  display: block;
	}
	
	#menu_bar li a:hover {
	  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
	  background: rgba(255, 255, 255, 0.1);
	  color: rgba(0, 35, 122, 0.7);
	}
	.name{
		text-align: center;
	    justify-content: center;
	    display: grid;
	    margin: 25px;
	}	
</style>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<header>
	<div class="headr-all"  align="center">
		<div class="name">
			<%@ include file="/WEB-INF/views/co_name.jsp" %>
		</div>
		<nav class="menu">
		  	<ul id="menu_bar">
		  		  <li>
		  	 		   <a href="index.jsp">Home</a>
		  	 	 </li>
		 	 	 <li>
		    	 	  <a href="gamelist.do?page=1&perPageNum=5&searchType=&keyword=">Game</a>
		   	  	 </li>
		 	 	 <li>
			    	  <a href="stadiumlist.do?page=1&perPageNum=5&searchType=&keyword=">Stadium</a>
			  	 </li>
			 	 <li>
		    	  		<a href="teamlist.do?page=1&perPageNum=10&searchType=&keyword=">Team</a>
			 	 </li>
			 	 <li>
		    	  	<c:if test = "${login == null }">
		    	  		<a href="redirect:index.jsp" onclick="loginPlz()">Mercenary</a>
		    	  	</c:if>
			 	 	<c:if test = "${login != null }">
			    	  <a href="mercenary.do">Mercenary</a>
		    	  	</c:if>
			 	 </li>
			 	 <li>
			    	  <a href="qnalist.do?page=1&perPageNum=5&searchType=&keyword=">QnA</a>
			 	 </li>
			 	 <li>
					  <!-- 로그인 하지 않은 상태 -->
					  <c:if test="${login == null }">
					  	<a href="loginform.do">Login</a>
					  </c:if>
				 </li>
				 <li>
				 	  <c:if test="${login == null }">
					  	<a href="registerform.do">Sign up</a>
					  </c:if>
				 </li>
				 <li>
				 	<!-- 로그인한 상태 -->
				 		<c:if test="${login != null && login.user_role == 'USER'}">
					 			<li><a href="logout.do">Logout</a></li>
					 			<li><a href="user_info.do?user_id=${login.user_id }">My page</a></li>
					 			<li><a>${login.user_name }님</a></li>
				 		</c:if>
				 		<c:if test="${login != null && login.user_role == 'ADMIN'}">
					 			<li><a href="logout.do">Logout</a></li>
					 			<li><a href="admin.do">Admin page</a></li>
					 			<li><a href="user_info.do?user_id=${login.user_id }">My page</a></li>
					 			<li><a>${login.user_name }님</a></li>
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
<script type="text/javascript">
	function loginPlz(){
		alert('로그인해주세요');
	}
</script>
</html>