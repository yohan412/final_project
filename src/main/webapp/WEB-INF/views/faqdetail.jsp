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
							<h4>제목</h4> 
							<label style="font-weight:bold; font-size: 15px; margin-left: 20px;">${faq_dto.faq_title }</label>
	
						</div>
						<div class="content-form">
							<h4>내용</h4>
							<textarea style="font-weight:bold; font-size: 15px; margin-left: 20px;" readonly>${faq_dto.faq_content }</textarea>
	
						</div>
						<div class="content-form">
							<h4>내용</h4>
							<textarea style="margin-left: 10px;">${faq_dto.faq_content }</textarea>
						</div>
					</div>
					
					<div class="button-form">
						<div class="content-submit" align="right">
							<button id="pointer" type="button" onclick="location.href='qnalist.do'">목록</button> 
							<button id="pointer" type="button" onclick="location.href='qnaupdateForm.do?qna_gpno=${qna_dto.qna_gpno}'">수정</button>
							<button id="pointer" type="button" onclick="qna_deleteChk(${login.user_no},${qna_dto.user_no },${qna_dto.qna_no })">삭제</button>
							<button id="pointer" name="comment-hidden" type="button" onclick= "location.href='qnaCommentForm.do?qna_gpno=${qna_dto.qna_gpno}'">답글</button>
						</div>
					</div>
					<br>
					<br>
					</div>
				</form>
			</div>
			
	</section>

</body>
<script type="text/javascript">
function adminChk(login_id, user_id, qna_no) {
	if(login_id != "admin"){
		alert('관리자만 작성할 수 있습니다.');
	} else{
		if(login_id === user_id){
		var chk = confirm('답글을 작성하시겠습니까?')
			if(chk){
				location.href='qnaanswer.do?qna_no='+qna_no;
			}else{
				alert('취소되었습니다.');
			}
		}
	}
}
function faq_deleteChk(login_no, user_no, qna_no){
	if(login_no != user_no){
		alert('작성자만 삭제할 수 있습니다.');
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

function comment_deleteChk(login_no, user_no, qna_gpsq){
	if(login_no != user_no){
		alert('운영자만 삭제할 수 있습니다.');
	}else{
		if(user_id === login_no){
			var chk = confirm('정말 삭제하시겠습니까?')
			
			if(chk){
				location.href='comment_delete.do?qna_gpsq'+qna_gqsq;
			}else{
				alert('취소되었습니다.');
			}
		}
	}
}




</script>














</html>