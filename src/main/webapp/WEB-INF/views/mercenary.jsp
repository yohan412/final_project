<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mercenary.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	function mainPage(){
		return "redirect:index.do"; // 메인페이지로 이동
	}
	
	function imgSrc_position(object) { // 클릭 시 포지션 이미지 변경 및 공격수~골키퍼 문자열 리턴
		if($(object).attr('class') == 'attacker'){
			document.getElementById("position").src = "img/footsalField01.png";
		} else if($(object).attr('class')  == 'defender'){
			document.getElementById("position").src = "img/footsalField02.png";
		} else if($(object).attr('class')  == 'leftWing'){
			document.getElementById("position").src = "img/footsalField03.png";
		} else if($(object).attr('class')  == 'rightWing'){
			document.getElementById("position").src = "img/footsalField04.png";
		} else {
			document.getElementById("position").src = "img/footsalField05.png";
		}
	    const position = $(object).attr('class');
	    console.log($('input:hidden'));
	    $('input:hidden').each(function() {
	        console.log($(this))
	        if ($(this).attr('id') == position) {
	            console.log($(this).val());
	            return $(this).val();
	        }
	            console.log($(this).attr('id'));
	    });
	}

</script>
<title>용병지원서</title>

</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section>
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="mercenary_insert.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<div class="top-box-content">
					<div class="title-text">	
						<h2>용병지원서</h2>
					</div>
					<hr>
					<div class="content-select-foot">
						<h5 class="head-text">1. *주 사용 발</h5>
						<label class="chk-foot"><input type="radio" name="mercenary_foot" value="L" required>왼발</label>
						<label class="chk-foot"><input type="radio" name="mercenary_foot" value="R" checked>오른발</label>
						<label class="chk-foot"><input type="radio" name="mercenary_foot" value="A">양발</label>
					</div>
					<hr>
					<div class="content-select-position">
						<h5 class="head-text">2. *포지션</h5>
					</div>
					<div class="select-position-detail">
						<img src="img/footsalFieldBasic.png" id="position" usemap="#image-map">
						<map name="image-map">
						    <area  style="cursor: pointer;" target="" class="attacker" title="공격수" onclick="imgSrc_position(this)" coords="312,187,23" shape="circle">
						    <area  style="cursor: pointer;" target="" class="defender" title="수비수" onclick="imgSrc_position(this)" coords="310,246,22" shape="circle">
						    <area  style="cursor: pointer;" target="" class="leftWing" title="좌측윙어" onclick="imgSrc_position(this)" coords="210,234,22" shape="circle">
						    <area  style="cursor: pointer;" target="" class="rightWing" title="우측윙어" onclick="imgSrc_position(this)" coords="407,231,21" shape="circle">
						    <area  style="cursor: pointer;" target="" class="keeper" title="골키퍼" onclick="imgSrc_position(this)" coords="310,299,22" shape="circle">
						</map>
						<input type="hidden" name="mercenary_position" id="attacker" value="공격수">
						<input type="hidden" name="mercenary_position" id="defender" value="수비수">
						<input type="hidden" name="mercenary_position" id="leftWing" value="좌측윙어">
						<input type="hidden" name="mercenary_position" id="rightWing" value="우측윙어">
						<input type="hidden" name="mercenary_position" id="keeper" value="골키퍼">
					</div>
					<hr>
					<div class="content-introduce">
						<h5 class="head-text">3. 자기소개 및 한마디</h5>
						<textarea rows="10" cols="60" name="mercenary_intro" placeholder="자기소개와 한마디를 적어주세요"></textarea>
					</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="이전" onclick="location.href='index.do'">
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