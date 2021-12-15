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
.stadium-write{
    text-align: left; 
	width: 700px; 
	margin: auto; 
}

h2{
    text-align: center;
}
input[type="submit"], input[type="button"] {
	width: 100px;
	height: 50px;
	border-style: dashed;
	
	font-weight: bold;
	float: right; 
    background-color: lightcoral;
  
}
</style>
</head>
<body>
    <%@ include file="./header.jsp"%>
    <!--경기장 게시글 작성-->
    <div class="stadium-write">
        <h2>경기장 게시글 작성</h2><br><br>
        <form action="" method="" class="stadium-write-form">
            <input type="hidden" name="s_no" value="">
            <table class="stadium-table">
                <tr>
                    <th>경기장 이미지</th>
                    <td><input type="file" name="">
                        <input type="image" src="" name="pic_name" value=""></td>
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
                            <input type="submit" value="등록">
                            <input type="button" value="목록" onclick="">
                        </ul>
                    </td>
                </tr>
            </table>

        </form>


    </div>
</body>
</html>