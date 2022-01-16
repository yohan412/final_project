<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/boarddetail.css">
<link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
    </style>
<meta charset="UTF-8">
<title>Q&A BOARD DETAIL</title>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<section>
		<div class="main-all-box">
				<form action="qnaupdateForm.do" method="post">
					<input type="hidden" name="user_id" value="${login.getUser_id()}">
					<input type="hidden" name="writer" value="${qna_dto.getUser_id() }">
					<input type="hidden" name="user_role" value="${user.getUser_role() }">
					<div class="top-box-content">
						<div class="title-text">
							<h2>Q & A 상세보기</h2>
						</div>
					</div>
				<div class="box-body">
				<div class="box-top">
					<div class="type-form">
						<h4>카테고리</h4>
						<label style="font-weight:bold; font-size: 15px; margin-left: 20px;">${qna_dto.qna_type }</label>
					</div>
					
					<div class="wirter-form">
						<h4>작성자</h4> 
						<label  style="font-weight:bold; font-size: 15px; margin-left: 20px;"> ${qna_dto.user_id }</label>
					</div>
					<div class="title-form">
						<h4>제목</h4>
						<label style="font-weight:bold; font-size: 15px; margin-left: 20px;" readonly="readonly">${qna_dto.qna_title }</label>

					</div>
					<div class="content-form">
						<h4>내용</h4>
						<textarea style="margin-left: 10px;">${qna_dto.qna_content }</textarea>
					</div>
				</div>
				
				<div class="button-form">
					<div class="content-submit" align="right">
						<button id="pointer" type="button" onclick="location.href='qnalist.do'">목록</button> 
						<button id="pointer" name="update-hidden" type="button" onclick="location.href='qnaupdateForm.do?qna_gpno=${qna_dto.qna_gpno}'">수정</button>
						<button id="pointer" type="button" onclick="qna_deleteChk(${login.user_no},${qna_dto.user_no },${qna_dto.qna_no })">삭제</button>
						<button id="pointer" name="comment-hidden" type="button" onclick= "location.href='qnaCommentForm.do?qna_gpno=${qna_dto.qna_gpno}'">답글</button>
					</div>
				</div>
				<br>
				<br>
				</div>
					<%--답글 리스트 라인 --%>
					<div class="content-box-body">
					<div class="con-type">
						<h4>카테고리</h4> 
						<label style="font-weight:bold; font-size: 15px; margin-left: 20px;" readonly="readonly">${qna_dto2.qna_type }</label>
					</div>
					<div class="con-writer">
						<h4>작성자</h4> 
						<label style="font-weight:bold; font-size: 15px; margin-left: 20px;" readonly="readonly">${qna_dto2.user_id }</label>
					</div>
					<div class="con-title">
						<h4>답글 제목</h4> 
						<label style="font-weight:bold; font-size: 15px; margin-left: 20px;" readonly="readonly">${qna_dto2.qna_title }</label>
					</div>
					<div class="con-content">
						<h4>답글 내용</h4> 
						<textarea style="margin-left: 10px;" readonly="readonly">${qna_dto2.qna_content }</textarea>
					</div>
					</div>
					
					
				</form>
			</div>
			
			
			
	</section>
<footer style="align-content: center;">
	<%@ include file="footer.jsp"%>
</footer>
</body>
<script type="text/javascript">
function qna_deleteChk(login_no, user_no, qna_no){
	if(login_no != user_no){
		alert('작성자만 삭제할 수 있습니다.');
	}else{
		if(user_no === login_no || user_role === 'ADMIN'){
			var chk = confirm('정말 삭제하시겠습니까?')
			
			if(chk){
				location.href='qnadelete.do?qna_no='+qna_no;
			}else{
				alert('취소되었습니다.');
			}
		}
	}
}
$(function(){
	var user_id = '${login.user_id}';  // 세션에 저장된 로그인 아이디
	var adminChk = '${login.user_role}'; // 어드민 여부
	
		$("button[name=comment-hidden]").hide();
	if(adminChk === 'ADMIN'){
		$("button[name=comment-hidden]").show();
	}else{
		$("button[name=comment-hidden]").hide();
	}
});

$(function(){
	var user_id = '${login.user_id}';  // 세션에 저장된 로그인 아이디
	var writer = '${qna_dto.user_id}';
	
		$("button[name=update-hidden]").hide();
	if(user_id === writer){
		$("button[name=update-hidden]").show();
	}else{
		$("button[name=update-hidden]").hide();
	}
});



</script>














</html>