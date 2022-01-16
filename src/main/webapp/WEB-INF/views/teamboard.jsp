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
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
<link href="https://webfontworld.github.io/mapo/MapoDPP.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
    </style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section class="body">
	<div class="main-all-box">
		<h1 style="text-align: center;">팀 명단</h1>
		<div class="table-board-list">
			<table class="team-table-striped" style="text-align: center; inline-block; border: 1px solid #dddddd; width: 900px;" align="center">
				<colgroup>
					<col class="team-no">
					<col class="team-logo">
					<col class="team-name">
					<col class="team-addchk">
				</colgroup>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 10%;">팀 번호</th>
						<th style="background-color: #eeeeee; text-align: center; width: 10%;">팀 로고</th>
						<th style="background-color: #eeeeee; text-align: center; width: 30%;">팀명</th>
						<th style="background-color: #eeeeee; text-align: center; width: 13%;">팀장</th>
						<th style="background-color: #eeeeee; text-align: center; width: 10%;">모집여부(Y/N)</th>
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
								<td>${Teamdto.user_id }</td> <!-- 팀장 -->
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
					<input type="button" id="prev-btn" onclick="location.href='teamlist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}'" value="<<">
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
					<c:choose>
						<c:when test="${idx eq page }">
							<input type="button" id="pagingnumClick" value="${idx }">
						</c:when>
						<c:otherwise>
							<input type="button" id="pagingnum" onclick="location.href='teamlist.do${pageMaker.makeSearch(idx) }'" value="${idx}">
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<input type="button" id="next-btn" onclick="location.href='teamlist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}'" value=">>">
				</c:if>
				
		</div>
		<div class="search" align="center">
			<select id="searchOption" name="searchType">
				<option value="n"<c:out value="${STLP.searchType == null ? 'selected' : '' }"/>>분류없음</option>
				<option value="w"<c:out value="${STLP.searchType == 'w' ? 'selected' : '' }"/>>작성자</option>
				<option value="t"<c:out value="${STLP.searchType == 't' ? 'selected' : '' }"/>>팀명</option>
				<option value="c"<c:out value="${STLP.searchType == 'c' ? 'selected' : '' }"/>>모집여부</option>
			</select>
			
			<input type="text" id="keywordInput" name="keyword"  value="${STLP.keyword }" required=""/>
			<label alt='검색어를 입력하세요' placeholder=''></label>
			<input type="image" id="searchBtn" src="img/icon_magnifier.png">
			
		</div>
		<div class="content-submit-list" align="right">
			<button id="pointer" onclick="loginChk(${login.user_no})">작성하기</button>
		</div>
			
	</div>
</section>
</body>
<footer style="margin-top: 150px;">
	<%@ include file="footer.jsp" %>
</footer>
<script type="text/javascript">

	function loginChk(user_no){
		if(user_no == null){
			alert('로그인 하셔야 작성이 가능합니다');
		}else{
			location.href='team.do';
		}
	}
	
	$(function(){
		$('#searchBtn').click(function(){
			if($('#keywordInput').val() == ""){
				alert('검색 내용을 입력해주세요');
			}else{
				self.location = "teamlist.do" + '${pageMaker.makeQuery(1)}' + 
				"&searchType=" + $("select option:selected").val() + 
				"&keyword=" + encodeURIComponent($('#keywordInput').val());
			}

		})
	});
	

</script>
</html>
