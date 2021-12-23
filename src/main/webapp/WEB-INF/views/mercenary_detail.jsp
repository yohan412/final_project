<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mercenary.css">

<title>용병지원서</title>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section>
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="#" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<div class="top-box-content">
					<div class="title-text">	
						<h2>용병지원서</h2>
					</div>
					<hr style="border: 1px solid green;">
					<div class=writer-name>
						<h3 style="text-align: center;">${login.getUser_id() }</h3> <!-- 작성자 id -->
					</div>
					<div class="content-select-foot">
						<h5 class="head-text">1. 주 사용 발</h5>
						<label class="chk-foot"><input type="radio" name="chk-position" checked>${detail.getMercenary_foot() }</label>
					</div>
					<hr style="border: 1px solid green;">
					<div class="content-select-position">
						<h5 class="head-text">2. 포지션</h5>
					</div>
					<div class="select-position-detail">
					<% if(detail.getMercenary_position() == "공격수"){ %> 
						<img src="img/footsalField01.png" readonly>
					<%}else if(detail.getMercenary_position() == "수비수") {%>
						<img src="img/footsalField02.png" readonly>
					<%}else if(detail.getMercenary_position() == "좌측윙어") {%>
						<img src="img/footsalField03.png" readonly>
					<%}else if(detail.getMercenary_position() == "우측윙어") {%>
						<img src="img/footsalField04.png" readonly>
					<%}else{ %>
						<img src="img/footsalField05.png" readonly>
					<%} %>
					</div>
					<hr style="border: 1px solid green;">
					<div class="content-introduce">
						<h5 class="head-text">3. 자기소개 및 한마디</h5>
						<textarea rows="10" cols="60" placeholder="자기소개와 한마디를 적어주세요" readonly>${detail.getMercenary_intro() }</textarea>
					</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="location.href='gamedetail.do?game_no=${gamedto.getGame_no()}'">
						<input id="pointer" type="button" value="수정" onclick="location.href='mercenaryUpdate.do?user_no=${detail.getUser_no()}'">
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
</html>