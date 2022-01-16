<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>FAQ BOARD DETAIL</title>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<section>
		<div class="main-all-box">
				<form action="faqupdateForm.do" method="post">
					<input type="hidden" name="user_id" value="${login.getUser_id()}" > 
					<div class="top-box-content">
						<div class="title-text">
							<h2>상세보기</h2>
						</div>
					</div>
					<div class="box-body">
					<div class="box-top">
						<div class="type-form">
							<h4>카테고리</h4> 
							<label style="font-weight:bold; font-size: 15px; margin-left: 20px;">${faq_dto.faq_type }</label>
						</div>
						
						<div class="writer-form">
							<h4>작성자</h4> 
							<label  style="font-weight:bold; font-size: 15px; margin-left: 20px;">${faq_dto.user_id }</label>
						</div>
						<div class="title-form">
							<h4>문의 내용</h4> 
							<label style="font-weight:bold; font-size: 15px; margin-left: 20px;">${faq_dto.faq_title }</label>
	
						</div>
						<div class="content-form">
							<h4>답변 내용</h4>
							<textarea style="font-weight:bold; font-size: 15px; margin-left: 20px;" readonly>${faq_dto.faq_content }</textarea>
	
						</div>
					</div>
					
					<div class="button-form">
						<div class="content-submit" align="right">
							<button id="pointer"  type="button" onclick="location.href='faqlist.do'">목록</button> 
							<button id="pointer" name="update-hidden" type="button" onclick="location.href='faqupdateForm.do?faq_no=${faq_dto.faq_no}'">수정</button>
							<button id="pointer" name="delete-hidden" type="button" onclick="faq_deleteChk(${login.user_no},${faq_dto.user_no },${faq_dto.faq_no })">삭제</button>
						</div>
					</div>
					<br>
					<br>
					</div>
				</form>
			</div>
			
	</section>

</body>
<footer style="align-content: center;">
	<%@ include file="footer.jsp"%>
</footer>
<script type="text/javascript">

function faq_deleteChk(login_no, user_no, qna_no){
	if(login_no != user_no){
		alert('관리자만 삭제할 수 있습니다.');
	}else{
		if(user_no === login_no){
			var chk = confirm('정말 삭제하시겠습니까?')
			
			if(chk){
				location.href='faqdelete.do?faq_no='+faq_no;
			}else{
				alert('취소되었습니다.');
			}
		}
	}
}

$(function(){
	var user_id = '${login.user_id}';  // 세션에 저장된 로그인 아이디
	var adminChk = '${login.user_role}'; // 어드민 여부
	
		$("button[name=update-hidden]").hide();
		$("button[name=delete-hidden]").hide();
	if(adminChk === 'ADMIN'){
		$("button[name=update-hidden]").show();
		$("button[name=delete-hidden]").show();
	}else{
		$("button[name=update-hidden]").hide();
		$("button[name=delete-hidden]").hide();
	}
});




</script>














</html>