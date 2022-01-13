<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/mercenary.css">
<script type="text/javascript">

	function imgSrc_position(value) { // 클릭 시 포지션 이미지 변경 및 공격수~골키퍼 문자열 리턴
		if(value == '공격수'){
			document.getElementById("position").src = "img/footsalField01.png";
		} else if(value == '수비수'){
			document.getElementById("position").src = "img/footsalField02.png";
		} else if(value == '좌측윙어'){
			document.getElementById("position").src = "img/footsalField03.png";
		} else if(value == '우측윙어'){
			document.getElementById("position").src = "img/footsalField04.png";
		} else {
			document.getElementById("position").src = "img/footsalField05.png";
		}
	    console.log(value);
	    $('input[name=mercenary_position]').attr('value', value);
	    console.log($('input:hidden'));
	}
</script>


<title>용병지원서</title>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section class="body">
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="mercenary_updateResult.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
			<input type="hidden" name="user_no" value="${mDto.getUser_no()}">
				<div class="top-box-content">
					<div class="title-text">	
						<h2>용병지원서</h2>
					</div>
					<div class=writer-name>
						<h3 style="text-align: center;">${mDto.getUser_id() }</h3> <!-- 작성자 id -->
					</div>
					<div class="content-select-foot">
						<h5 class="head-text">1. 주 사용 발</h5>
						<label class="chk-foot"><input type="radio" name="mercenary_foot" value="L" required>왼발</label>
						<label class="chk-foot"><input type="radio" name="mercenary_foot" value="R" checked>오른발</label>
						<label class="chk-foot"><input type="radio" name="mercenary_foot" value="A">양발</label>
					</div>
					<div class="content-select-position" align="center">
						<h5 class="head-text">2. 포지션</h5>
						<input style="outline: none; text-align:center; border: 0px solid black" readonly id="position-text" type="text" value="${mDto.getMercenary_position() }">
						<input type="hidden" id="db-position" value="${mDto.getMercenary_position() }">
					</div>
					<div class="select-position-detail">
					<c:choose>
						<c:when test="${mDto.getMercenary_position() == '공격수' }">
							<img src="img/footsalField01.png" id="position" usemap="#image-map">
							<map name="image-map">
							    <area  style="cursor: pointer;" target="" class="attacker" title="공격수" onclick="imgSrc_position('공격수')" coords="312,187,23" shape="circle">
							    <area  style="cursor: pointer;" target="" class="defender" title="수비수" onclick="imgSrc_position('수비수')" coords="310,246,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="leftWing" title="좌측윙어" onclick="imgSrc_position('좌측윙어')" coords="210,234,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="rightWing" title="우측윙어" onclick="imgSrc_position('우측윙어')" coords="407,231,21" shape="circle">
							    <area  style="cursor: pointer;" target="" class="keeper" title="골키퍼" onclick="imgSrc_position('골키퍼')" coords="310,299,22" shape="circle">
							</map>
							<input type="hidden" name="mercenary_position" id="hiddenInput" value="">
						</c:when>
						<c:when test="${mDto.getMercenary_position() == '수비수' }">
							<img src="img/footsalField02.png" id="position" usemap="#image-map">
							<map name="image-map">
							    <area  style="cursor: pointer;" target="" class="attacker" title="공격수" onclick="imgSrc_position('공격수')" coords="312,187,23" shape="circle">
							    <area  style="cursor: pointer;" target="" class="defender" title="수비수" onclick="imgSrc_position('수비수')" coords="310,246,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="leftWing" title="좌측윙어" onclick="imgSrc_position('좌측윙어')" coords="210,234,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="rightWing" title="우측윙어" onclick="imgSrc_position('우측윙어')" coords="407,231,21" shape="circle">
							    <area  style="cursor: pointer;" target="" class="keeper" title="골키퍼" onclick="imgSrc_position('골키퍼')" coords="310,299,22" shape="circle">
							</map>
							<input type="hidden" name="mercenary_position" id="hiddenInput" value="">
						</c:when>
						<c:when test="${mDto.getMercenary_position() == '좌측윙어' }">
							<img src="img/footsalField03.png" id="position" usemap="#image-map">
							<map name="image-map">
							    <area  style="cursor: pointer;" target="" class="attacker" title="공격수" onclick="imgSrc_position('공격수')" coords="312,187,23" shape="circle">
							    <area  style="cursor: pointer;" target="" class="defender" title="수비수" onclick="imgSrc_position('수비수')" coords="310,246,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="leftWing" title="좌측윙어" onclick="imgSrc_position('좌측윙어')" coords="210,234,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="rightWing" title="우측윙어" onclick="imgSrc_position('우측윙어')" coords="407,231,21" shape="circle">
							    <area  style="cursor: pointer;" target="" class="keeper" title="골키퍼" onclick="imgSrc_position('골키퍼')" coords="310,299,22" shape="circle">
							</map>
							<input type="hidden" name="mercenary_position" id="hiddenInput" value="">
						</c:when>
						<c:when test="${mDto.getMercenary_position() == '우측윙어' }">
							<img src="img/footsalField04.png" id="position" usemap="#image-map">
							<map name="image-map">
							    <area  style="cursor: pointer;" target="" class="attacker" title="공격수" onclick="imgSrc_position('공격수')" coords="312,187,23" shape="circle">
							    <area  style="cursor: pointer;" target="" class="defender" title="수비수" onclick="imgSrc_position('수비수')" coords="310,246,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="leftWing" title="좌측윙어" onclick="imgSrc_position('좌측윙어')" coords="210,234,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="rightWing" title="우측윙어" onclick="imgSrc_position('우측윙어')" coords="407,231,21" shape="circle">
							    <area  style="cursor: pointer;" target="" class="keeper" title="골키퍼" onclick="imgSrc_position('골키퍼')" coords="310,299,22" shape="circle">
							</map>
							<input type="hidden" name="mercenary_position" id="hiddenInput" value="">
						</c:when>
						<c:when test="${mDto.getMercenary_position() == '골키퍼' }">
							<img src="img/footsalField05.png"id="position" usemap="#image-map">
							<map name="image-map">
							    <area  style="cursor: pointer;" target="" class="attacker" title="공격수" onclick="imgSrc_position('공격수')" coords="312,187,23" shape="circle">
							    <area  style="cursor: pointer;" target="" class="defender" title="수비수" onclick="imgSrc_position('수비수')" coords="310,246,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="leftWing" title="좌측윙어" onclick="imgSrc_position('좌측윙어')" coords="210,234,22" shape="circle">
							    <area  style="cursor: pointer;" target="" class="rightWing" title="우측윙어" onclick="imgSrc_position('우측윙어')" coords="407,231,21" shape="circle">
							    <area  style="cursor: pointer;" target="" class="keeper" title="골키퍼" onclick="imgSrc_position('골키퍼')" coords="310,299,22" shape="circle">
							</map>
							<input type="hidden" name="mercenary_position" id="hiddenInput" value="">
						</c:when>
					</c:choose>
					</div>
					<div class="content-introduce">
						<h5 class="head-text">3. 자기소개 및 한마디</h5>
						<textarea rows="10" cols="60" name="mercenary_intro" placeholder="자기소개와 한마디를 적어주세요">${mDto.getMercenary_intro() }</textarea>
					</div>
					<div class="content-submit" align="right">
						<button id="pointer" style="margin-right: 110px" onclick="location.href='referer.do'">이전</button>
						<button id="pointer" style="margin-right: 5px; margin-top: 15px;" type="submit">수정완료</button>
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

	function imgSrc_position(value) { // 클릭 시 포지션 이미지 변경 및 공격수~골키퍼 문자열 리턴
		if(value == '공격수'){
			document.getElementById("position").src = "img/footsalField01.png";
		} else if(value == '수비수'){
			document.getElementById("position").src = "img/footsalField02.png";
		} else if(value == '좌측윙어'){
			document.getElementById("position").src = "img/footsalField03.png";
		} else if(value == '우측윙어'){
			document.getElementById("position").src = "img/footsalField04.png";
		} else {
			document.getElementById("position").src = "img/footsalField05.png";
		}
		  $('input[id=position-text]').attr('value', value);
		  $('input[name=mercenary_position]').attr('value', value);
	}
</script>
</html>