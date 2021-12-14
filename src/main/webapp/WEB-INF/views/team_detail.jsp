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
로고 및 로그인 반응형메뉴바 자리(헤더)
</header>
<section>
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="#" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<div class="top-box-content">
					<div class="title-text">	
						<h2>디비값 팀이름</h2>
					</div>
					<hr style="border: 1px solid green;">
					<div class="content-select-teamname">
						<h5 class="head-text">1. 팀명</h5>
						<label class="chk-team-name"><input type="text" style="border: 0px;" name="team-name"  readonly><!-- DB값 --></label>
					</div>
					<hr style="border: 1px solid green;">
					<div class="content-select-position">
						<h5 class="head-text">2. 현재 인원</h5>
						<label class="chk-team-person"><input type="number" style="border: 0px;" name="team-person" readonly><!-- DB값 --></label>
					</div>
					<hr style="border: 1px solid green;">
					<div class="content-teamlogo">
						<h5 class="head-text">3. 팀 로고</h5>
						<img src=""><!-- DB값 -->
					</div>
					<div class="content-introduce">
						<h5 class="head-text">4. 팀 소개 및 한마디</h5>
						<textarea rows="10" cols="60" readonly><!-- DB값 --></textarea>
					</div>
					
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="">
						<input id="pointer" type="button" value="수정" onclick="">
						<input id="pointer" type="button" value="삭제" onclick="">
					</div>
					
				</div>
			</form>
		</div>
	</div>
</section>
<footer>
푸터자리
</footer>
</body>
<script type="text/javascript">
	$("#team-logo").on('change',function(){
	  var fileName = $("#team-logo").val();
	  $(".upload-name").val(fileName);
});
</script>
</html>