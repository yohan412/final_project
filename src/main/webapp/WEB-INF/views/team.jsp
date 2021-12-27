<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
			<form action="teamInsert.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<input type="hidden" name="user_no" value="${login.getUser_no()}" readonly>
				<div class="top-box-content">
					<div class="title-text">	
						<h2>팀 등록서</h2>
					</div>
					<hr>
					<div class="content-select-teamname">
						<h5 class="head-text">1. *팀명</h5>
						<label class="chk-team-name"><input type="text" name="team_name" placeholder="팀명을 입력해주세요" required></label>
					</div>
					<hr>
					<div class="content-addchk">
						<h5 class="head-text">2. 모집 여부</h5>
						<input type="radio" name="team_addchk" value="Y" required>Y
						<input type="radio" name="team_addchk" value="N">N
					</div>
					<hr>
					<div class="content-teamlogo">
						<h5 class="head-text">3. 팀 로고</h5>
						<input class="upload-name" name="pic_name" value="" placeholder="첨부파일" readonly>
						<input class="upload-path" type="hidden" name="pic_path" value="">
						<p style="color:red; font-weight:blod;"><form:errors path="pic_path" /></p>
						
						<label for="team-logo">팀 로고 선택</label>
						<input type="file" id="team-logo">
					</div>
					<div class="content-introduce">
						<h5 class="head-text">4. 팀 소개 및 한마디</h5>
						<textarea rows="10" cols="60" name="team_intro" placeholder="팀 소개와 한마디를 적어주세요" required></textarea>
					</div>
					<hr>
					
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="location.href='teamlist.do'">
						<input id="pointer" type="submit" value="작성완료">
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
	  var value = $("#team-logo").val();
      $('input[name=pic_name]').attr('value', value);
      $('input[name=pic_path]').attr('value', value);
      console.log(value);
});
</script>
</html>
