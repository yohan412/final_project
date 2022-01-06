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

<title>용병지원서</title>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section class="body">
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="mercenary_updateForm.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
			<input type="hidden" name="user_no" value="${mDto.getUser_no()}">
				<div class="top-box-content">
					<div class="title-text">	
						<h2>용병지원서</h2>
					</div>
					<hr>
					<div class=writer-name>
						<h3 style="text-align: center;">${mDto.getUser_id() }</h3> <!-- 작성자 id -->
						<div class="team-logo">
							<img src="">
						</div>
					</div>
					<div class="content-select-foot">
						<h5 class="head-text">1. 주 사용 발</h5>
						<label class="chk-foot"><input type="radio" name="mercenary_foot" value="${mDto.getMercenary_foot() }" checked></label>
					</div>
					<hr>
					<div class="content-select-position" align="center">
						<h5 class="head-text">2. 포지션</h5>
						<input style="outline: none; text-align:center; border: 0px solid black" readonly id="position-text" type="text" value="">
						<input type="hidden" id="db-position" value="${mDto.getMercenary_position() }">
					</div>
					<div class="select-position-detail">
					<c:choose>
						<c:when test="${mDto.getMercenary_position() == '공격수' }">
							<img src="img/footsalField01.png" readonly>
						</c:when>
						<c:when test="${mDto.getMercenary_position() == '수비수' }">
							<img src="img/footsalField02.png" readonly>
						</c:when>
						<c:when test="${mDto.getMercenary_position() == '좌측윙어' }">
							<img src="img/footsalField03.png" readonly>
						</c:when>
						<c:when test="${mDto.getMercenary_position() == '우측윙어' }">
							<img src="img/footsalField04.png" readonly>
						</c:when>
						<c:when test="${mDto.getMercenary_position() == '골키퍼' }">
							<img src="img/footsalField05.png" readonly>
						</c:when>
					</c:choose>
					</div>
					<hr>
					<div class="content-introduce">
						<h5 class="head-text">3. 자기소개 및 한마디</h5>
						<textarea rows="10" cols="60" placeholder="자기소개와 한마디를 적어주세요" readonly>${mDto.getMercenary_intro() }</textarea>
					</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="이전" onclick="location.href='referer.do'">
						<input id="pointer" type="button" value="수정" onclick="location.href='mercenary_updateForm.do?user_no=${mDto.getUser_no()}'">
						<input id="pointer" type="button" value="삭제" onclick="location.href='mercenary_delete.do?user_no=${mDto.getUser_no()}'">
						
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
	function writerChk(user_no, login_no){
		if(login_no == null || login_no == ""){
			alert('로그인 하셔야 수정이 가능합니다.');
		}else if(login_no != user_no){
			alert('작성자만 수정이 가능합니다.')
		}else{
			location.href='mercenaryUpdate.do?user_no='+user_no;
		}
	}
	
	$(function(){
		var position = document.getElementById("db-position").value;
		if(position == '공격수'){
			$('input[id=position-text]').attr('value', '공격수');
		}else if(position == '수비수'){
			$('input[id=position-text]').attr('value', '수비수');
		}else if(position == '좌측윙어'){
			$('input[id=position-text]').attr('value', '좌측윙어');
		}else if(position == '우측윙어'){
			$('input[id=position-text]').attr('value', '우측윙어');
		}else{
			$('input[id=position-text]').attr('value', '골키퍼');
		}
	})
</script>
</html>