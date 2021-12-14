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
						<h2>팀 등록서</h2>
					</div>
					<hr>
					<div class="content-select-teamname">
						<h5 class="head-text">1. *팀명</h5>
						<label class="chk-team-name"><input type="text" name="team-name" placeholder="팀명을 입력해주세요" required></label>
					</div>
					<hr>
					<div class="content-select-position">
						<h5 class="head-text">2. *현재 인원</h5>
						<label class="chk-team-person"><input type="number" name="team-person" placeholder="팀 인원을 입력해주세요" required></label>
					</div>
					<hr>
					<div class="content-teamlogo">
						<h5 class="head-text">3. 팀 로고</h5>
						<input class="upload-name" value="파일명" placeholder="첨부파일" readonly>
						<label for="team-logo">팀 로고 선택</label>
						<input type="file" id="team-logo">
					</div>
					<div class="content-introduce">
						<h5 class="head-text">4. 팀 소개 및 한마디</h5>
						<textarea rows="10" cols="60" placeholder="팀 소개와 한마디를 적어주세요"></textarea>
					</div>
					
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="">
						<input id="pointer" type="submit" value="작성완료">
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
