<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장 게시물 작성</title>
<link href='<c:url value="${path}/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="${path}/resources/css/stadiuminsert.css"/>' rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</style>
</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <div id="titleform">경기장 작성</div>
        <form role="form" method="get" onsubmit="return false">
            <div id="top_form">
                <div id="stadium_name_form">
                    <div class="font">경기장 이름</div>
                    <div class="info">
                        <input type="text" placeholder="경기장 이름" name="game_stadium" id="stadium_name" class="inputform">
                    </div>
                </div>
                <div id="stadium_addr_form">
                    <div class="addr_title">
                        <div class="font">경기장 주소</div>
                    </div>
                    <div class="addr_info">
                        <div style="width: 100%; height: 50%; display: flex; align-items: center">
                            <input type="text" placeholder="경기장 주소" name="game_addr" id="stadium_addr" class="inputform" readonly>
                        </div>
                    </div>
                    <div class="button_form">
                        <div style="width: 100%; height: 100%; display: flex; align-items: center">
                            <input type="button" value="주소 찾기" id="addr_button" onclick="Addr_api();">
                        </div>
                    </div>
                </div>
                <div id="stadium_webaddr_form">
                    <div class="font">경기장 홈페이지 주소</div>
                    <div class="info">
                        <input type="text" placeholder="경기장 홈페이지" name="game_stadium" id="stadium_name" class="inputform">
                    </div>
                </div>
                <div id="stadium_phone_form">
                    <div class="font">경기장 전화번호</div>
                    <div class="info">
                        <input type="text" placeholder="경기장 이름" name="game_stadium" id="stadium_name" class="inputform">
                    </div>
                </div>
                <div id="stadium_content_form">
                    <div class="content_title_form">
                        <div id="content_title">
                            기타 내용
                        </div>
                        <div style="width: 180px; height: 70%"></div>
                    </div>
                    <div class="info">
                        <textarea id="textarea" name="game_content"></textarea>
                    </div>
                </div>
                <div id="stadium_upload_form">
                    <div>
                        <div>경기장 사진 업로드</div>
                    </div>
                    <div>업로드 기능 공간</div>
                </div>
                <div id="button_form"><input type="submit" value="경기장 등록" id="button"></div>
            </div>
        </form>
    </div>
</section>
<footer>

</footer>
</body>
</html>