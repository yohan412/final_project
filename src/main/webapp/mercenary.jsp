<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mercenary.css">

<title>용병지원서</title>
</head>
<body>
<header>
로고 및 로그인 반응형메뉴바 자리(헤더)
</header>
<section>
	<div class="main-all-box">
		<div class="main-top-box">
			<form action="#" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<div class="top-box-content">
					<div class="title-text">	
						<h2>용병지원서</h2>
					</div>
					<div class="content-rate">
						<h5 class="head-text">1. 본인이 생각하는 실력</h5>
					</div>
					<div class="content-rate-detail">
						<!-- onclick 이벤트로 클릭 활성화되면 백그라운드컬러 검은색으로 변경, alert로 마이페이지 반영x 안내 -->
						<div class="chk-rate" onclick="" align="center"><p>최상</p></div>
						<div class="chk-rate" onclick="" align="center"><p>상</p></div>
						<div class="chk-rate" onclick="" align="center"><p>중</p></div>
						<div class="chk-rate" onclick="" align="center"><p>하</p></div>
					</div>
					<div class="content-select-foot">
						<h5 class="head-text">2. 주 사용 발</h5>
						<label class="chk-foot"><input type="radio" name="chk-position" value="L">왼발</label>
						<label class="chk-foot"><input type="radio" name="chk-position" value="R">오른발</label>
						<label class="chk-foot"><input type="radio" name="chk-position" value="A">양발</label>
					</div>
					<div class="content-select-position">
						<h5 class="head-text">3. 포지션</h5>
					</div>
					<div class="select-position-detail">
						<div class="chk-position" onclick="" align="center"><p>공격수</p></div>
						<div class="chk-position" onclick="" align="center"><p>수비수</p></div>
						<div class="chk-position" onclick="" align="center"><p>윙</p></div>
						<div class="chk-position" onclick="" align="center"><p>골키퍼</p></div>
					</div>
					<div class="content-introduce">
						<h5 class="head-text">4. 자기소개 및 한마디</h5>
						<textarea rows="10" cols="60" placeholder="자기소개와 한마디를 적어주세요"></textarea>
					</div>
					<div class="content-submit" align="right">
						<input id="pointer" type="button" value="목록" onclick="">
						<input id="pointer" type="submit" value="작성완료">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<footer>
푸터자리
</footer>
</body>
</html>