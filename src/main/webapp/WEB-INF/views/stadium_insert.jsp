<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='<c:url value="/resources/css/header.css"/>' rel="stylesheet">
    <title>경기장 게시물 작성</title>
<style type="text/css">


input[type="submit"]:hover, input[type="button"]:hover {
	background-color: #c4c1e0 !important;
}

.review-search-section input, select {
	font-size: medium;
	width: auto;
	height: auto;
	text-align: center;
}

input[type="text"], select {
	padding: 10px;
}
</style>
</head>
<body>
    <%@ include file="./header.jsp"%>
    <!--경기장 게시글 작성-->
    <div class="stadium-write">
        <form action="" method="" class="stadium-write-form">
            <input type="hidden" name="s_no" value="">
            <table class="stadium-table" width="100%">
                <tr>
                    <th>경기장 이미지</th>
                    <td><input type="image" src="" name="pic_name" value=""></td>
                </tr>
                <tr>
                    <th>경기장 이름</th>
                    <td><input type="text" name="s_name" placeholder="이름을 입력하세요"></td>
                    <td></td>
                </tr>
                <tr>
                    <th>경기장 설명</th>
                    <td><textarea rows="10" cols="60" name="s_content" placeholder="내용을 입력하세요"></textarea></td>
                </tr>
                <tr>
                    <th>경기장 주소</th>
                    <td><input type="text" name="s_addr" placeholder="주소를 입력하세요"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <ul>
                            <li><input type="submit" value="등록"></li>
                            <li><input type="button" value="목록" onclick=""></li>
                        </ul>
                    </td>
                </tr>
            </table>

        </form>


    </div>
</body>
</html>