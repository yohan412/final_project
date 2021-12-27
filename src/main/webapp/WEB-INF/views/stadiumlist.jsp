<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>경기장 리스트</title>
<link href='<c:url value="/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/stadiumlist.css"/>' rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/stadiumlist.js"></script>
</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <div id="titleform">경기장 목록</div>
        <form role="form" method="get" onsubmit="return false">
            <div id="searchform">
                <div id="search_box_form">
                    <div id="search_box">
                        <input type="text" name="search" id="search" value="${gameSearch.keyword}" onkeypress="if(event.keyCode===13){gamesearch()}" >
                        <input type="button" id="button" value="검색">
                    </div>
                </div>
                <div id="select_box_form">
                    <div id="select_region_form">
                        <select name="stadium_region" id="stadium_region"></select>
                    </div>
                    <div id="select_detail_form">
                        <select name="stadium_detail" id="stadium_detail"></select>
                    </div>
                </div>
                <div id="search_button_form">

                </div>
            </div>
            <div id="listform">

            </div>
            <div id="pagingform">

            </div>
        </form>
    </div>
</section>
<footer>

</footer>
</body>
</html>