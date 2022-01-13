<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 등록서</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/team.css">
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<section class="body">
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="team_updateForm.do" method="post">
				<div class="top-box-content">
					<div class="title-text">	
						<h2>Welcome ${teamDto.team_name }</h2>
						<img style="object-fit:cover; width:150px; height: 100px;" class="pic_path" src="/upload/${teamDto.pic_path }" alt="로고없음">
						<!-- DB값 -->
					</div>
					<div class="content-select-teamname">
						<h5 class="head-text">1. 팀명</h5>
						<label class="detail-team-name" style="font-weight:bold; font-size: 22px;">${teamDto.team_name }</label>
					</div>
					<div class="content-select-position">
						<h5 class="head-text">2. 모집 여부</h5>
						<label class="chk-team-person" style="font-weight:bold; font-size: 22px;">${teamDto.team_addchk }</label>
					</div>

					<div class="content-introduce">
						<h5 class="head-text">4. 팀 소개 및 한마디</h5>
						<textarea rows="10" cols="60" name="team_intro" readonly>${teamDto.team_intro }</textarea>
						<input type="hidden" id="team_wirter" name="user_phone" value="${teamDto.user_phone }" readonly>
					</div>
					
					
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="location.href='teamlist.do'">
						<input id="pointer" name="update-hidden" type="button" value="수정" onclick="team_updateChk(${login.user_no},${teamDto.user_no },${teamDto.team_no })'">
						<input id="pointer" name="delete-hidden" type="button" value="삭제" onclick="team_deleteChk(${login.user_no},${teamDto.user_no},${teamDto.team_no})">
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
	
	function team_deleteChk(login_no, user_no, team_no){
		if(login_no === null || login_no === ""){
			alert('로그인을 해주세요');
		}else if(login_no != user_no){
			alert('팀장만 삭제할 수 있습니다.')
		}else{
			if(user_no === login_no){
				var chk = confirm('정말 삭제하시겠습니까?')
				
				if(chk){
					location.href='team_delete.do?team_no='+team_no;
				}else{
					alert('취소되었습니다.');
				}
			}
		}
	}
	
	function team_updateChk(login_no, user_no, team_no){
		if(login_no === null || login_no === ""){
			alert('로그인을 해주세요');
		}else if(login_no != user_no){
			alert('팀장만 삭제할 수 있습니다.')
		}else{
			if(user_no === login_no){
				var chk = confirm('수정하시겠습니까?')
				
				if(chk){
					location.href='team_update.do?team_no='+team_no;
				}else{
					alert('취소되었습니다.');
				}
			}
		}
	}
	var phone = document.getElementsByName("user_phone")[0];
	
	function sign_up(login_no){
		if(login_no == null || login_no == ""){
			alert('로그인을 해주세요.');
		}else{
				$.ajax({
					type: "post",
					url: "team_inviteMsg.do",
					data:{user_phone:phone.value},
					success: function(){
						alert("문자전송 완료");
					},
					error: function(){
						alert("통신실패");
					}
				});
			}
			
		}
	$(function(){ // 작성자가 아니면 숨기기
		var login_id = '${login.user_id};'
		var user_id = '${teamDto.user_id};'
			console.log(user_id);
			console.log(login_id);
		
		$("input[name='update-hidden']").hide();
		$("input[name='delete-hidden']").hide();
		
		if(login_id === user_id){
			$("input[name='update-hidden']").show();
			$("input[name='delete-hidden']").show();
		}
	});

</script>
</html>
