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
<meta charset="UTF-8">
<title>Q&A BOARD DETAIL</title>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<div class="a-blank-space" style="height: 50px;"></div>
	<section>
		<div class="main-all-box">
				<form action="qnaupdateForm.do" method="post">
					<%-- <input type="hidden" name="user_id" value="${login.getUser_id()}" readonly> --%>
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
						<label style="font-weight:bold; font-size: 15px; margin-left: 20px;" readonly>${qna_dto.qna_title }</label>

					</div>
					<div class="content-form">
						<h4>내용</h4>
						<textarea style="margin-left: 20px;">${qna_dto.qna_content }</textarea>
					</div>
				</div>
				
				<div class="button-form">
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록"
							onclick="location.href='qnalist.do'"> <input id="pointer"
							type="button" value="수정"
							onclick="location.href='qnaupdateForm.do?qna_no=${qna_dto.qna_no}'">
						<input id="pointer" type="button" value="삭제"
							onclick="qna_deleteChk(${login.user_no},${qna_dto.user_no },${qna_dto.qna_no })">
						<input id="pointer" type="button" value="답글"
							onclick= "location.href='qnaCommentForm.do?qna_gpno=${qna_dto.qna_gpno}'">
						<%-- /*adminChk(${login.login_id}, ${qna_dto.user_id }, ${qna_dto.qna_no })*/ 관리자 확인 주석 수정중--%>
					</div>
				</div>
				</div>
					<%--답글 리스트 라인 --%>
					<div class="content-box-body">
					<div class="con-type">
						<label>카테고리</label> <label class="detail-qna-cartagory"
							style="font-weight: bold;">${qna_dto2.qna_type }</label>
					</div>
					<div class="con-writer">
						<label>작성자</label> <label class="detail-qna-writer"
							style="font-weight: bold;">${qna_dto2.user_id }</label>
					</div>
					<div class="con-title">
						<label>답글 제목</label> <label>${qna_dto2.qna_title }</label>
					</div>
					<div class="con-content">
						<label>답글 내용</label> <label>${qna_dto2.qna_content }</label>
					</div>
					</div>
					
					
				</form>
			</div>
			
			
			
	</section>

	<%-- <input id="pointer" type="button" value="수정" onclick="location.href='commentupdateForm.do?qna_no=${qna_dto.qna_no}'">
					<input id="pointer" type="button" value="삭제"
								onclick="comment_deleteChk(${login.user_no},${qna_dto.user_no },${qna_dto.qna_gpsq })"> --%>
</body>
<script type="text/javascript">
/* function adminChk(login_id, user_id, qna_no) {
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
} */
function qna_deleteChk(login_no, user_no, qna_no){
	if(login_no != user_no){
		alert('작성자만 삭제할 수 있습니다.');
	}else{
		if(user_no === login_no){
			var chk = confirm('정말 삭제하시겠습니까?')
			
			if(chk){
				location.href='qnadelete.do?qna_no='+qna_no;
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