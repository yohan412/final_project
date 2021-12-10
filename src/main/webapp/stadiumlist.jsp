<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
    margin-left: 0;
    margin-right: 0;
}
h2 {
    text-align: center;
}
#search-box-stadium {
    text-align: center;
}
input {
    font-size: large;
}

</style>
</head>
<body>
    <main>
    <h2>경기장 목록</h2>
    <div id="search-box-stadium">
        <form action="" method="">
            <input type="hidden" name="command" value="searchMain">
            <input type="text" name="keyword"><input type="submit" value="검색">
            <select class="choosecity" name="city">
                <option value="1"></option>
                
            </select>
            <select class="choosetown" name="town">
                <option value="1"></option>
            </select>
        </form>
    </div>
    <div id="stadium-list">
        <ul class="image-list">
            <c:choose>
                <c:when test="">
                    <li>글이 존재하지 않습니다.</li>
                </c:when>
                <c:otherwise>
                    <c:forEach>

                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    <input type="button" value="글쓰기" onclick="">
</body>
</html>