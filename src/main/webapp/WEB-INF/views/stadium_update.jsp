<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="./header.jsp"%>
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
                    <td></td>
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
                            <li><input type="button" value="취소" onclick=""></li>
                            <li><input type="button" value="목록" onclick=""></li>
                        </ul>
                    </td>
                </tr>
            </table>

        </form>
	
	

    </div> 
</body>
</html>