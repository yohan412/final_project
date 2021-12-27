<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 등록서</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/team.css">
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section>
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="team_updateForm.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<div class="top-box-content">
					<div class="title-text">	
						<h2>Welcome ${teamDto.team_name }</h2>
					</div>
					<hr>
					<div class="content-select-teamname">
						<h5 class="head-text">1. 팀명</h5>
						<label class="detail-team-name" style="font-weight:bold; font-size: 22px;">${teamDto.team_name }</label>
					</div>
					<hr>
					<div class="content-select-position">
						<h5 class="head-text">2. 모집 여부</h5>
						<label class="chk-team-person" style="font-weight:bold; font-size: 22px;">${teamDto.team_addchk }</label>
					</div>
					<hr>
					<div class="content-teamlogo">
						<h5 class="head-text">3. 팀 로고</h5>
						<img src=""><!-- DB값 -->
					</div>
					<div class="content-introduce">
						<h5 class="head-text">4. 팀 소개 및 한마디</h5>
						<textarea rows="10" cols="60" name="team_intro" readonly>${teamDto.team_intro }</textarea>
					</div>
					
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="location.href='teamlist.do'">
						<input id="pointer" type="button" value="수정" onclick="location.href='team_updateForm.do?team_no=${teamDto.team_no}'">
						<input id="pointer" type="button" value="삭제" onclick="location.href='team_delete.do'">
					</div>
					
				</div>
			</form>
		</div>
	</div>
</section>
<footer>
	<%@ include file="footer.jsp" %>
</footer>
</body>
<script type="text/javascript">
	$("#team-logo").on('change',function(){
	  var fileName = $("#team-logo").val();
	  $(".upload-name").val(fileName);
});
</script>
</html>
