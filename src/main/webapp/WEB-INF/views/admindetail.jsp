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
#pointer{
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-color: transparent;
  border: none;
  border-radius: 0.5em;
  box-shadow: 0 0 0 2px rgba(211, 211, 211, 0.5) inset;
  margin: auto;
  padding: 1.2rem 3rem;
  position: relative;
  cursor: pointer;
}
#pointer::before, #pointer::after {
  content: "";
  position: absolute;
  height: 0;
  width: 2px;
  transition: height 0.4s 0.4s cubic-bezier(0.86, 0, 0.07, 1), width 0.4s cubic-bezier(0.86, 0, 0.07, 1);
}
#pointer::before {
  box-shadow: 2px 2px 0 #000080  inset;
  bottom: 0;
  left: 0;
}
#pointer::after {
  box-shadow: -2px -2px 0 #000080  inset;
  top: 0;
  right: 0;
}
#pointer:hover::before, #pointer:hover::after {
  height: 100%;
  width: 100%;
  border-radius: 0.5em;
  transition: height 0.4s cubic-bezier(0.86, 0, 0.07, 1), width 0.4s 0.4s cubic-bezier(0.86, 0, 0.07, 1);
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
a{
	font-family: 'GangwonEduSaeeum';
	font-size: 20px;
}	
</style>
<link href="https://webfontworld.github.io/gangwon/GangwonEduSaeeum.css" rel="stylesheet">
</head>
<body>
<section>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div style="text-align: center; margin-top: 50px;">	
		<h1>?????? ??????</h1>
	</div>
	<div class="user_info" align="center">
			<table class="type04" align="center" method="post" cellpadding="5">
				<tr>
					<th>?????????</th>
					<td>${aDto.user_id }</td>
				</tr>
				<tr>
					<th>??????</th>
					<td>${aDto.user_name }</td>
				</tr>
				<tr>
					<th>??????</th>
					<td>${aDto.user_gender }</td>
				</tr>
				<tr>
					<th>????????????</th>
					<td>${aDto.user_birthdate }</td>
				</tr>
				<tr>
					<th>??????</th>
					<td>${aDto.user_role }</td>
				</tr>
				<tr>
					<th>?????????</th>
					<td>${aDto.user_email }</td>
				</tr>
				<tr>
					<th>?????????</th>
					<td>${aDto.user_phone }</td>
				</tr>
				<tr>
					<th>????????????</th> 
					<td>${aDto.user_zip }</td>
				</tr>
				<tr>
					<th>??????</th>
					<td>${aDto.user_addr }</td>
				</tr>
				<tr>
					<th>?????? ?????????</th>
					<td><a href="mercenary_detail.do?user_no=${login.user_no}" style="color: black;">????????????</a></td>
				</tr>
			</table>
			<div class="content-submit-list" style="margin-left: 270px;">
				<button id="pointer" type="button" onclick="location.href='aupdateform.do?user_id=${aDto.user_id}'">??????</button>
				<button id="pointer" type="button" onclick="location.href='adelete.do?user_id=${aDto.user_id}'">????????????</button>
			</div>	
	</div>
</section>
<footer style="text-align: center; margin-top: 100px;"><%@ include file="/WEB-INF/views/footer.jsp" %></footer>
</body>
</html>