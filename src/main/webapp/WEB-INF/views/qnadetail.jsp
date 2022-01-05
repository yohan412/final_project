<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/boarddetail.css">
<meta charset="UTF-8">
<title>Q&A BOARD DETAIL</title>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
	<section>
		<div class="main-all-box">
			<div class="top-box-content">
			<form action="qnaupdateForm.do" method="post">
			<%-- <input type="hidden" name="user_id" value="${login.getUser_id()}" readonly> --%>
					<div class="top-box-content">
						<div class="title-text">
							<h2>상세보기</h2>
						</div>
						</div>
						<div class="box-body"></div>
						<div class="form-group">
							<label>카테고리</label>
							<label class="detail-qna-cartagory" style="font-weight:bold;">${qna_dto.qna_type }</label>
						</div>
						<div class="form-group">
							<label>작성자</label>
							<label class="detail-qna-writer" style="font-weight:bold;">${qna_dto.user_id }</label>
						</div>
						<div class="form-group">
							<label>제목</label>
							<label class="detail-qna-title" style="font-weight:bold;">${qna_dto.qna_title }</label>
					
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="detail-qna-content" style="font-weight:bold;">${qna_dto.qna_content }</textarea>

						</div>
						<div class="content-submit" align="right">
							<input id="pointer" type="button" value="목록"
								onclick="location.href='qnalist.do'"> <input
								id="pointer" type="button" value="수정"
								onclick="location.href='qnaupdateForm.do?qna_no=${qna_dto.qna_no}'">
							<input id="pointer" type="button" value="삭제"
								onclick="qna_deleteChk(${login.user_no},${qna_dto.user_no },${qna_dto.qna_no })">
							<input id="pointer" type="button" value="답글" 
								onclick="location.href='qnaanswerinsert.do?qna_no=${qna_dto.qna_no}'">
								<%-- /*adminChk(${login.login_id}, ${qna_dto.user_id }, ${qna_dto.qna_no })*/ 관리자 확인 주석 수정중--%> 
						</div>
				</form>
				<div>
				<div>
					<!-- comment -->
				</div>
				<div class="comment-txt">
					<label>아이디</label>
					<label>${qna_dto.user_id }</label>
				</div>
				</div>
			</div>
		</div>
	</section>
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





</script>














</html>