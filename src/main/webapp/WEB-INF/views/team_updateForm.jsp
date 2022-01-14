<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 등록서</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
			<form action="team_updateResult.do" method="post" enctype="multipart/form-data"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<div class="top-box-content">
					<div class="title-text">	
						<h2>Welcome ${teamDto.team_name }</h2>
					</div>
					
					<div class="content-select-teamname">
						<h5 class="head-text">1. 팀명</h5>
						<input type="hidden" name="team_no" value="${teamDto.team_no }">
						<label class="chk-team-name"><input type="text" name="team_name" placeholder="${teamDto.team_name }"
						 value="${teamDto.team_name }" required></label>
					</div>
					
					<div class="content-select-position">
						<h5 class="head-text">2. 모집 여부</h5>
						<input type="radio" name="team_addchk" value="Y">Y
						<input type="radio" name="team_addchk" value="N">N
					</div>
					
					<div class="content-teamlogo">
						<h5 class="head-text">3. 팀 로고</h5>
						<input class="upload-name" name="pic_path" value="${teamDto.pic_path }" placeholder="첨부파일" readonly>
						<input class="upload-path" type="hidden" name="pic_path" value="">
						
						<label for="team-logo">팀 로고 선택</label>
						<input type="file" multiple="multiple" id="team-logo" name="upload_file">
					</div>
					<hr>
					<div class="content-introduce">
						<h5 class="head-text">4. 팀 소개 및 한마디</h5>
						<textarea rows="10" cols="60" name="team_intro">${teamDto.team_intro }</textarea>
					</div>
					
					<div class="content-submit" align="right">
						<button id="pointer" style="margin-right: 110px;" onclick="location.href='teamlist.do'">목록</button>
						<button id="pointer" style="margin-right: 5px; margin-top: 15px;" type="submit">수정완료</button>
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
	  var value = $("#team-logo").val();
    $('input[name=pic_path]').attr('value', value);
    console.log(value);
});
</script>
</html>
