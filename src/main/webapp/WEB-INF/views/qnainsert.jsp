<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/qna.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>용병지원서</title>

</head>
<body>
<header>
	<%-- <%@ include file="header.jsp" %> --%>
</header>
<section>
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="qnainsert.do" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<input type="hidden" name="user_no" value="${login.getUser_no()}" readonly>
				<input type="hidden" name="user_id" value="${login.getUser_id()}" readonly>
				
				<div class="top-box-content">
					<div class="title-text">	
						<h2>QNA</h2>
					</div>
					<hr>
					<div class="content-select-foot">
						<select id="cg">
							<option name="qna_type" value="신고">신고</option>
							<option name="qna_type" value="계정문의">계정문의</option>
							<option name="qna_type" value="이용방법문의">이용방법문의</option>
						</select>
						
						<input type="text" naem="qna_title" placeholder="제목을 입력해주세요">
					</div>
					<hr>
					<div class="content-select-position">
						<textarea row="10" cols="60" name="qna_content" placeholder="문의 내용을 입력해주세요."></textarea>
					</div>
					<hr>
					<div class="content-teamlogo">
						<input class="upload-name" name="" value="" placeholder="첨부파일" readonly>
						<input class="upload-path" type="hidden" name="" value="">
						<label for="team-logo">첨부파일</label>
						<input type="file" id="team-logo">
					</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="이전" onclick="location.href='index.do'">
						<input id="pointer" type="submit" value="작성완료">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<footer>
	<%-- <%@ include file="footer.jsp" %> --%>
</footer>
</body>
<script type="text/javascript">
$("#team-logo").on('change',function(){
	  var fileName = $("#team-logo").val();
	  $(".upload-name").val(fileName);
	  var value = $("#team-logo").val();
    $('input[name=pic_name]').attr('value', value);
    $('input[name=pic_path]').attr('value', value);
    console.log(value);
});
</script>
</html>