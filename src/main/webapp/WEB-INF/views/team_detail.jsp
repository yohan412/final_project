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
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
    </style>
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
						<c:choose>
							<c:when test="${teamDto.team_addchk eq 'Y'.charAt(0) }">
								<label class="chk-team-person" style="font-weight:bold; font-size: 22px;">지원가능</label>
							</c:when>
							<c:otherwise>
								<label class="chk-team-person" style="font-weight:bold; font-size: 22px;">모집종료</label>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="content-introduce">
						<h5 class="head-text">4. 팀 소개 및 한마디</h5>
						<textarea rows="10" cols="60" name="team_intro" style="border: none; outline: none; border-bottom: 1px solid #ccc" readonly>${teamDto.team_intro }</textarea>
						<input type="hidden" id="team_wirter" name="user_phone" value="${teamDto.user_phone }" readonly>
					</div>
					
					<div id="hidden_form">
						<div id="apply-list-form">
						<c:choose>
							<c:when test = "${empty uDto }">
								<div id="apply-list" style="justify-content: center">
									<p>------------ 지원자가 아직 없습니다 ------------</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${uDto}" var="uDto">
									<div id="apply-list">
										<div id="apply-id">${uDto.user_id }</div>
										<div id="apply-name">${uDto.user_name }</div>
										<div id="send-invite">
											<button id="pointer" type="button" style="padding: 0.5rem 1.5rem; margin-left: 78px;"
											onclick="send_invite('${uDto.user_id}','${teamDto.user_id }')">초대하기</button>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
					
					
					<div class="content-submit" align="right">
						<button id="pointer" type="button" style="margin-right: 110px;"
						onclick="location.href='teamlist.do'">목록</button>
						<button id="pointer" type="button" style="margin-right: 110px;" name="update-hidden" onclick="team_updateChk(${login.user_no},${teamDto.user_no },${teamDto.team_no })">수정</button>
						<button id="pointer" type="button" style="margin-right: 110px;" name="team-apply" onclick="team_apply('${login.user_name }', '${login.user_phone }', ${teamDto.team_no }, ${login.user_no })">지원하기</button>
						<button id="pointer" type="button" style="margin-right: 4px; margin-top: 15px;"
						name="delete-hidden" onclick="team_deleteChk(${login.user_no},${teamDto.user_no},${teamDto.team_no})">삭제</button>
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
					location.href='team_updateForm.do?team_no='+team_no;
				}else{
					alert('취소되었습니다.');
				}
			}
		}
	}
	
	$(function(){ // 작성자가 아니면 숨기기
		var login_id = '${login.user_id};'
		var user_id = '${teamDto.user_id};'
		
	    $("#hidden_form").hide(); // 히든폼은 그냥 숨기기
		$("button[name='update-hidden']").hide();
		$("button[name='delete-hidden']").hide();
		
		if(login_id === user_id){
			$("button[name='update-hidden']").show();
			$("button[name='delete-hidden']").show();
			$("#hidden_form").show();
		}
	});
	$(function(){ //로그인하지 않았으면 숨기기
		var login_id = '${login.user_id};'
		$("button[name='team-apply']").hide();
		
		if(login_id != ";" ){
			$("button[name='team-apply']").show();
		}
	});

	function team_apply(user_name, user_phone, team_no, user_no){
		$.ajax({
			type:"post",
			url: "team_inviteMsg.do",
			data:{
				"user_name" : user_name,
				"user_phone" : user_phone,
				"team_no" : team_no,
				"user_no" : user_no
			},
			success:function(){
				alert('팀에 지원했습니다.');
			},
			error:function(){
				alert('전송실패');
			}
		});
	}
	
	function send_invite(user_id, writer_id){
		var chk = confirm('초대하시겠습니까?');
		
		if(chk){
			$.ajax({
				type:"post",
				url: "send_invite.do",
				data:{
					"user_id" : user_id,
					"writer_id" : writer_id
				},
				success:function(){
					alert('초대했습니다.');
				},
				error:function(){
					alert('전송실패');
				}
			})
		}else{
				alert('취소하셨습니다.');
		}
	}

</script>
</html>
