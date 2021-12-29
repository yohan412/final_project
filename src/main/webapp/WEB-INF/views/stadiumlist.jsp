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
                        <input type="text" name="search" id="search" value="" onkeypress="if(event.keyCode===13){gamesearch()}" >
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
                    <input type="button" id="search_button" value="검색">
                </div>
            </div>
            <div id="listform">
                <c:forEach begin="1" end="5">
                    <div class="list" onclick="location.href='stadiumdetail.do?stadium_no=1'">
                        <div class="stadium_picture_form">
                            <img src="" class="stadium_img" title="width=200px, height=150px">
                        </div>
                        <div class="stadium_introduce_form">
                            <div class="stadium_introduce">${gamedto.game_content}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div id="pagingform">
                <div style="width: 200px; height: 100%"></div>
                <div style="width: 500px; height: 100%; display: flex; align-items: center; justify-content: center; background-color: blue">
<%--                    <c:if test="${gamepagemaker.prev}">
                        <input type="button" id="prevbutton" onclick="location.href='gamelist.do${gamepagemaker.makeSearch(gamepagemaker.startPage - 1)}'" value="<">
                    </c:if>
                    <c:forEach begin="${gamepagemaker.startPage}" end="${gamepagemaker.endPage}" var="idx">
                        <input type="button" id="pagingnum" onclick="location.href='gamelist.do${gamepagemaker.makeSearch(idx)}'" value="${idx}">
                    </c:forEach>
                    <c:if test="${gamepagemaker.next && gamepagemaker.endPage > 0}">
                        <input type="button" id="nextbutton" onclick="location.href='gamelist.do${gamepagemaker.makeSearch(gamepagemaker.endPage + 1)}'" value=">">
                    </c:if>--%>
                </div>
                <div style="width: 200px; height: 100%; display: flex; align-items: center; justify-content: center">
                    <input type="button" value="경기장 등록" id="stadium_insert_button" onclick="stadium_insert('${userDto.user_id}')">
                    <script type="text/javascript">
                        if(${userDto.user_role eq 'ADMIN'}){
                            $("#stadium_insert_button").show();
                        }else{
                            $("#stadium_insert_button").hide();
                        }
                    </script>
                </div>
            </div>
        </form>
    </div>
</section>
<footer>

</footer>
</body>
</html>