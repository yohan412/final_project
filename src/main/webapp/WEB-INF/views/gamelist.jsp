<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='<c:url value="/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/gamelist.css"/>' rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <c:forEach items="${gamelist}" var="gamelist">
                <div class="list" onclick="location.href='gamedetail.do?game_no=${gamelist.game_no}'">
                    <div id="region">${gamelist.game_region}</div>
                    <div id="date">
                        <div id="date_status">D-Day</div>
                        <div id="date_info"><fmt:formatDate value="${gamelist.game_date}" pattern="yyyy-MM-dd"/></div>
                    </div>
                    <div id="time">20:00 ~ 22:00</div>
                    <div id="stadium">${gamelist.game_stadium}</div>
                    <div id="person">5 vs 5</div>
                    <div id="state">모집중</div>
                </div>
            </c:forEach>
        </div>
        <div id="pagingform">
            <c:if test="${gamepagemaker.prev}">
                <button id="prevbutton" onclick="location.href=''"><a href="gamelist.do${gamepagemaker.makeQuery(gamepagemaker.startPage - 1)}"><</a></button>
            </c:if>
            <c:forEach begin="${gamepagemaker.startPage}" end="${gamepagemaker.endPage}" var="idx">
                <button id="pagingnum"><a href="gamelist.do${gamepagemaker.makeQuery(idx)}">${idx}</a></button>
            </c:forEach>
            <c:if test="${gamepagemaker.next && gamepagemaker.endPage > 0}">
                <button id="nextbutton"><a href="gamelist.do${gamepagemaker.makeQuery(gamepagemaker.endPage + 1)}">></a></button>
            </c:if>
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