<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='<c:url value="${path}/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="${path}/resources/css/mainform.css"/>' rel="stylesheet">
<title>경기 일정 목록</title>
</head>
<body>
<header>
로고
</header>
<section>
    <div id="mainform">
        <div id="titleform">
            <h2>경기 일정 목록</h2>
        </div>
        <div id="listform">
            <c:forEach begin="1" end="5">
                <div class="list" onclick="location.href='detail'">
                    <div id="region">인천</div>
                    <div id="date">
                        <div id="date_status">D-Day</div>
                        <div id="date_info">2021-12-12</div>
                    </div>
                    <div id="time">20:00 ~ 22:00</div>
                    <div id="stadium">xx 경기장</div>
                    <div id="person">5 vs 5</div>
                    <div id="state">모집중</div>
                </div>
            </c:forEach>
        </div>
        <div id="pagingform">
            <button id="prevbutton"><a href="#"><</a></button>
            <c:forEach begin="1" end="5">
                <button id="pagingnum"><a href="#">1</a></button>
            </c:forEach>
            <button id="nextbutton"><a href="#">></a></button>
        </div>
        <div id="serchform">
            <div>
                <input type="text" name="serch" id="search">
                <input type="button" id="button" value="검색">
            </div>
        </div>
    </div>
</section>
<footer>
	푸터
</footer>
</body>
</html>