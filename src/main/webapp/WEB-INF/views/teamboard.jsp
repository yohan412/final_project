<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 등록서</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
								<td class="team-logo-pic"><img class="pic_path" src="/upload/${Teamdto.pic_path }" alt="로고없음"></td> <!-- 팀 로고 사진 -->
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
		<div class="page-list" align="center">
			
				<c:if test="${pageMaker.prev }">
					<a href="location.href='teamlist.do${pageMaker.makeQuery(pageMaker.startPage - 1)}'">이전</a>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
					<a href="location.href='teamlist.do${pageMaker.makeQuery(idx) }'">${idx}</a>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<a href="location.href='teamlist.do${pageMaker.makeQuery(pageMaker.endPage + 1)}'">다음</a>
				</c:if>
				
		</div>
		<div class="content-submit-list" align="right">
			<input id="pointer" type="button" value="작성하기" onclick="loginChk(${login.user_no})">
		</div>
	</div>
</section>
<footer>
	<%@ include file="footer.jsp" %>
</footer>
</body>
<script type="text/javascript">

	function loginChk(user_no){
		if(user_no == null){
			alert('로그인 하셔야 작성이 가능합니다');
		}else{
			location.href='team.do';
		}
	}
	
</script>
</html>
