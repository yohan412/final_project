<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="main-all-box">
		<div class="main-top-box">
			<form action="#" method="post"> <!-- 용병지원서만 보이는 jsp 페이지로 보낼예정 -->
				<div class="top-box-content">
					<div class="content-rate">
						<select name="rate-select">
							<option value="">최상</option>
							<option value="">상</option>
							<option value="">중</option>
							<option value="">하</option>
						</select>
					</div>
					<div class="content-select-position">
						<label><input type="checkbox" name="chk-position" value="L">왼발</label>
						<label><input type="checkbox" name="chk-position" value="R">오른발</label>
						<label><input type="checkbox" name="chk-position" value="A">양발</label>
					</div>
					<div class="content-introduce">
						
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>