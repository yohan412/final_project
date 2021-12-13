<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 등록서</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/teamboard.css">
</head>
<body>
<header>
로고 및 로그인 반응형메뉴바 자리(헤더)
</header>
<section>
	<div class="main-all-box">
		<h1 style="text-align: center;">팀명</h1>
		<div class="table-board-list">
			<table class="team-table-striped" style="text-align: center; inline-block; border: 1px solid #dddddd" align="center">
				<colgroup>
					<col class="team-no">
					<col class="team-logo">
					<col class="team-name">
					<col class="team-date">
				</colgroup>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">팀 번호</th>
						<th style="background-color: #eeeeee; text-align: center;">팀 로고</th>
						<th style="background-color: #eeeeee; text-align: center;">팀명</th>
						<th style="background-color: #eeeeee; text-align: center;">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- for문 반복해서 db값 가져오기 -->
						<td class="team-no">1</td>
						<td class="team-logo">팀 로고</td>
						<td class="team-name"><a href="#">팀명</a></td>
						<td class="team-date">등록일</td>
					</tr>
					<tr>
						<td class="team-no">1</td>
						<td class="team-logo">팀 로고</td>
						<td class="team-name"><a href="#">팀명</a></td>
						<td class="team-date">등록일</td>
					</tr>
					<tr>
						<td class="team-no">1</td>
						<td class="team-logo">팀 로고</td>
						<td class="team-name"><a href="#">팀명</a></td>
						<td class="team-date">등록일</td>
					</tr>
					<tr>
						<td class="team-no">1</td>
						<td class="team-logo">팀 로고</td>
						<td class="team-name"><a href="#">팀명</a></td>
						<td class="team-date">등록일</td>
					</tr>
					<tr>
						<td class="team-no">1</td>
						<td class="team-logo">팀 로고</td>
						<td class="team-name"><a href="#">팀명</a></td>
						<td class="team-date">등록일</td>
					</tr>
				</tbody>
			</table>		
		</div>
		<!-- 페이지 리스트 -->
			<!-- <c:if test="${}"> -->
			<!-- </c:if> -->
		<div class="page-list" align="center">
	           <button id="prevbutton"><a href="#"><</a></button>
	           <c:forEach begin="1" end="5">
	               <button id="pagingnum"><a href="#">1</a></button>
	           </c:forEach>
	           <button id="nextbutton"><a href="#">></a></button>
		</div>
	</div>
</section>
<footer>
푸터자리
</footer>
</body>
</html>
