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
	<%@ include file="header.jsp" %>
</header>
<section>
	<div class="main-all-box">
		<h1 style="text-align: center;">팀 명단</h1>
		<div class="table-board-list">
			<table class="team-table-striped" style="text-align: center; inline-block; border: 1px solid #dddddd" align="center">
				<colgroup>
					<col class="team-no">
					<col class="team-logo">
					<col class="team-name">
					<col class="team-addchk">
				</colgroup>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">팀 번호</th>
						<th style="background-color: #eeeeee; text-align: center;">팀 로고</th>
						<th style="background-color: #eeeeee; text-align: center;">팀명</th>
						<th style="background-color: #eeeeee; text-align: center;">모집여부(Y/N)</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
					<c:when test = "${empty list }">
						<tr>
							<td colspan="4" align="center">-------- 작성된 글이 없습니다 ----------</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="Teamdto">
							<tr>
								<td>${Teamdto.team_no }</td> <!-- 팀 번호 -->
								<td></td> <!-- 팀 로고 사진 -->
								<td><a href="team_detail.do?team_no=${Teamdto.team_no }">${Teamdto.team_name }</a></td>
								<!-- 팀 번호가 일치하는 팀이름 -->
								<td>${Teamdto.team_addchk }</td> <!-- 팀 모집여부 -->
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
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
		<div class="content-submit-list" align="right">
			<input id="pointer" type="button" value="작성하기" onclick="location.href='team.do'">
		</div>
	</div>
</section>
<footer>
	<%@ include file="footer.jsp" %>
</footer>
</body>
</html>
