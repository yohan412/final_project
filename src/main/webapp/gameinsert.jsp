<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 등록</title>
    <link href='<c:url value="${path}/resources/css/body.css"/>' rel="stylesheet">
    <link href='<c:url value="${path}/resources/css/gameinsert.css"/>' rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="${path}/resources/js/gameinsert.js"></script>
</head>
<body>
<header>
    헤더
</header>
<section>
    <div id="mainform">
        <div id="titleform"><div style="font-size: 30px; font-weight: bold">경기 등록</div></div>
        <div id="top_form">
            <div id="region_form">
            	<div class="font">지역이름</div>
                <div class="info">
                    <select style="width: 200px; height: 35px">
                    	<option>지역</option>
                        <option>서울</option>
                        <option>경기</option>
                        <option>인천</option>
                        <option>강원</option>
                        <option>충북</option>
                        <option>충남</option>
                        <option>전북</option>
                        <option>전남</option>
                        <option>경북</option>
                        <option>경남</option>
                        <option>제주</option>
                    </select>
                </div>
            </div>
            <div id="stadium_name_form">
                <div class="font">경기장 이름</div>
                <div class="info">
                    <input type="text" placeholder="경기장 이름" name="stadium_name" id="stadium_name" class="inputform">
                </div>
            </div>
            <div id="stadium_addr_form">
                <div class="addr_title">
                    <div style="width:100%; height: 100%; display: flex; align-items: center">경기장 주소</div>
                </div>
                <div class="addr_info">
                	<div style="width: 100%; height: 50%; display: flex; align-items: center">
                	    <input type="text" placeholder="경기장 주소" name="stadium_addr" id="stadium_addr" class="inputform">
                	</div>
                </div>
                <div class="button_form">
                    <div style="width: 100%; height: 100%; display: flex; align-items: center">
                        <input type="submit" value="주소 찾기" id="addr_button" onclick="Addr_api();">
                    </div>
                </div>
            </div>
            <div id="game_date_form">
                <div class="font">경기 날짜</div>
                <div class="info">
                    <input type="date" placeholder="날짜 입력" name="game_date" id="game_date">
                </div>
            </div>
            <div id="game_time_form">
                <div class="font">경기 시간</div>
                <div class="info">
                    <div style="width: 400px; height: 100%; display: flex; flex-wrap: wrap">
                        <div style="width: 400px; height: 100%; display: flex; align-items: center;">
                            <input type="time" class="time_form">
                        </div>
                    </div>
                </div>
            </div>
            <div id="game_player_form">
                <div class="font">팀 인원</div>
                <div class="info">
                <select style="width: 200px; height: 35px">
                    <option>인원</option>
                    <option>3vs3</option>
                    <option>4vs4</option>
                    <option>5vs5</option>
                    <option>6vs6</option>
                    <option>7vs7</option>
                </select>
                </div>
            </div>
            <div id="mergency_form">
                <div id="mergency_title">
                    용병 여부
                </div>
                <div class="info">
                    <div id="mergency_yn_form">
                        <div style="width: 250px; height: 100%; display: flex; flex-wrap: wrap">
                            <div class="radio_form">
                                <div class="radio_button">
                                    <input type="radio" name="mergency_yn" value="Y" class="radio">
                                </div>
                                <div class="radio_comment">Y</div>
                            </div>
                            <div class="radio_form">
                                <div class="radio_button">
                                    <input type="radio" name="mergency_yn" value="N" class="radio">
                                </div>
                                <div class="radio_comment">N</div>
                            </div>
                        </div>
                    </div>
                    <div id="mergency_player_form">
                        <div id="mergency">
                            <div id="mergency_player_title">필요 용병 수</div>
                            <div id="mergency_player_input_form">
                                <input type="number" placeholder="필요 용병 수" id="player_input" max="7">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="game_content_form">
                <div class="content_title_form">
                    <div id="content_title">
                        기타 내용
                    </div>
                    <div style="width: 180px; height: 70%"></div>
                </div>
                <div class="info">
                	<textarea id="textarea"></textarea>
                </div>
            </div>
            <div id="button_form"><input type="submit" value="경기 등록" id="button"></div>
        </div>
    </div>
</section>
<footer>
    푸터
</footer>
</body>
</html>