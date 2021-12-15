<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mercenary.css">
<script type="text/javascript">

	function mainPage(){
		location.href = 'https://localhost:8787/index.do'
	}
	
	var num = 1;
	function changeImg(idx){
		if(idx){
			if(num==5) return;
			num++;
		} else {
			if(num==1) return;
			num--;
		}
		var imgTag = document.getElementById("position");
		imgTag.setAttribute("src", "img/footsalFieldPosition0"+num+".png");
	
	}
</script>
<title>용병지원서</title>
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
						<h2>용병지원서</h2>
					</div>
					<hr>
					<div class="content-select-foot">
						<h5 class="head-text">1. *주 사용 발</h5>
						<label class="chk-foot"><input type="radio" name="chk-position" value="L" required>왼발</label>
						<label class="chk-foot"><input type="radio" name="chk-position" value="R" checked>오른발</label>
						<label class="chk-foot"><input type="radio" name="chk-position" value="A">양발</label>
					</div>
					<hr>
					<div class="content-select-position">
						<h5 class="head-text">2. *포지션</h5>
					</div>
					<div class="select-position-detail">
						<img src="img/footsalFieldBasic.png" id="position" usemap="#image-map">
						<map name="image-map">
						
						    <area  style="cursor: pointer;" target="" alt="공격수" title="공격수" onclick="changeImg()" coords="312,187,23" shape="circle">
						    <area  style="cursor: pointer;" target="" alt="수비수" title="수비수" onclick="" coords="310,246,22" shape="circle">
						    <area  style="cursor: pointer;" target="" alt="좌측윙어" title="좌측윙어" onclick="" coords="210,234,22" shape="circle">
						    <area  style="cursor: pointer;" target="" alt="우측윙어" title="우측윙어" onclick="" coords="407,231,21" shape="circle">
						    <area  style="cursor: pointer;" target="" alt="골키퍼" title="골키퍼" onclick="" coords="310,299,22" shape="circle">
						</map>
					</div>
					<hr>
					<div class="content-introduce">
						<h5 class="head-text">3. 자기소개 및 한마디</h5>
						<textarea rows="10" cols="60" placeholder="자기소개와 한마디를 적어주세요"></textarea>
					</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="이전" onclick="mainPage()">
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
	
	${".select-position-detail"}.click(function(e) ){
	 // 클릭시에 세션이 없으면 로그인 해달라고 말하기
		// var userno = "<모듈러=userno%>";
		// if(userno == 0) {
		// alert("로그인을 해주세요.");
		//	return;
		}
		$.ajax({
			type: "POST",
			url: "http://localhost:8787/fostal/MercenaryController",
			dataType: "text", 	// return 타입

			success : function(imgLink){
				if()
			}
		})
		
	}
	
</script>
</html>