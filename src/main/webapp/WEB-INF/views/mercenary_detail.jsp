<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/mercenary.css">
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
    </style>

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
					<div class=writer-name>
						<h3 style="text-align: center;">${mDto.getUser_id() } 님</h3> <!-- 작성자 id -->
					</div>
					<div class="content-select-foot">
						<h5 class="head-text">1. 주 사용 발</h5>
						<p id="explain-text">(A: 올라운더 / L: 왼발 / R: 오른발)</p>
						<label class="chk-foot">${mDto.getMercenary_foot() }</label>
					</div>
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
					<div class="content-introduce" style="border-bottom: 3px solid #ccc">
						<h5 class="head-text">3. 자기소개 및 한마디</h5>
						<textarea rows="10" cols="60" style="border: 0; outline: none;" readonly>${mDto.getMercenary_intro() }</textarea>
					</div>
					<div class="content-submit" align="right">
						<button id="pointer" style="margin-right: 110px;"
						onclick="location.href='referer.do'">이전</button>
						<button id="pointer" style="margin-right: 110px;"
						name="update-hidden" onclick="updateChk()">수정</button>
						<button id="pointer" style="margin-right: 5px; margin-top: 15px;"
						name="delete-hidden" onclick="deleteChk()">삭제</button>
						
					</div>
					<div class="blank-space" style="height: 150px;">
					
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
	};
	
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
	});
	
	$(function(){ // 용병지원서 작성자가 아니면 삭제 및 수정버튼 숨기기
		var writer = '${mDto.user_no}'; // 작성자
		var user_id = '${login.user_no}';  // 세션에 저장된 로그인 아이디
		var adminChk = '${login.user_role}'; // 어드민 여부
		
		$("input[name=update-hidden]").hide();
		$("input[name=delete-hidden]").hide();
		if(writer == user_id){
			$("input[name=update-hidden]").show();
			$("input[name=delete-hidden]").show();
		}else if(adminChk === 'ADMIN'){
			$("input[name=update-hidden]").show();
			$("input[name=delete-hidden]").show();
		}else{
			$("input[name=update-hidden]").hide();
			$("input[name=delete-hidden]").hide();
		}
	});
	
	function updateChk(){
		var user_role = '${login.user_role}'; // 로그인 유저의 role
		var user_id = '${login.user_id}'; // 로그인 유저
		var writer = '${mDto.user_id}'; // 작성자
		
		if(user_role === 'ADMIN'){
			var chk = confirm('수정 하시겠습니까?');
			if(chk){
				location.href='mercenary_updateForm.do?user_no=${mDto.getUser_no()}';
			}else{
				alert('취소되었습니다.');
			}
		}else if(user_role === 'USER' || writer === user_id){
			var chk = confirm('수정 하시겠습니까?');
			if(chk){
				location.href='mercenary_updateForm.do?user_no=${mDto.getUser_no()}'
			}else{
				alert('취소되었습니다.');
			}
		}else{
			alert('작성자만 수정할 수 있습니다.');
		}
	}
	function deleteChk(){
		var user_role = '${login.user_role}'; // 로그인 유저의 role
		var user_id = '${login.user_id}'; // 로그인 유저
		var writer = '${mDto.user_id}'; // 작성자
		var user_no = '${login.user_no}'; // 로그인 유저의 번호
		
		if(user_role === 'ADMIN'){
			var chk = confirm('삭제 하시겠습니까?');
			if(chk){
				location.href='mercenaryDelete.do?user_no='+user_no;
			}else{
				alert('취소되었습니다.');
			}
		}else if(user_role === 'USER' || writer === user_id){
			var chk = confirm('삭제 하시겠습니까?');
			if(chk){
				location.href='mercenaryDelete.do?user_no='+user_no;
			}else{
				alert('취소되었습니다.');
			}
		}else{
			alert('작성자만 삭제할 수 있습니다.');
		}
	}
	
</script>
</html>