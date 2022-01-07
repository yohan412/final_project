<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>경기 등록</title>
    <link href='<c:url value="${path}/resources/css/body.css"/>' rel="stylesheet">
    <link href='<c:url value="${path}/resources/css/gameinsert.css"/>' rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/gameupdate.js"></script>
</head>
<body>
<header style="height: 220px">
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <div id="titleform"><div style="font-size: 30px; font-weight: bold">경기 수정</div></div>
        <form:form action="/gameupdate.do" method="post" onsubmit="return sd('${userDto.user_id}')">
            <input type="hidden" name="game_no" value="${gameDto.game_no}">
            <div id="top_form">
                <div id="region_form">
                    <div class="font">지역이름</div>
                    <div class="info">
                        <select name="game_region" style="width: 258px; height: 35px">
                            <option value="예시">지역</option>
                            <option value="서울" <c:if test="${gameDto.game_region eq '서울'}">selected</c:if>>서울</option>
                            <option value="경기" <c:if test="${gameDto.game_region eq '경기'}">selected</c:if>>경기</option>
                            <option value="인천" <c:if test="${gameDto.game_region eq '인천'}">selected</c:if>>인천</option>
                            <option value="강원" <c:if test="${gameDto.game_region eq '강원'}">selected</c:if>>강원</option>
                            <option value="충북" <c:if test="${gameDto.game_region eq '충북'}">selected</c:if>>충북</option>
                            <option value="충남" <c:if test="${gameDto.game_region eq '충남'}">selected</c:if>>충남</option>
                            <option value="전북" <c:if test="${gameDto.game_region eq '전북'}">selected</c:if>>전북</option>
                            <option value="전남" <c:if test="${gameDto.game_region eq '전남'}">selected</c:if>>전남</option>
                            <option value="경북" <c:if test="${gameDto.game_region eq '경북'}">selected</c:if>>경북</option>
                            <option value="경남" <c:if test="${gameDto.game_region eq '경남'}">selected</c:if>>경남</option>
                            <option value="제주" <c:if test="${gameDto.game_region eq '제주'}">selected</c:if>>제주</option>
                        </select>
                    </div>
                </div>
                <div id="stadium_name_form">
                    <div class="font">경기장 이름</div>
                    <div class="info">
                        <input type="text" placeholder="경기장 이름" name="game_stadium" id="stadium_name" class="inputform" value="${gameDto.game_stadium}">
                    </div>
                </div>
                <div id="stadium_addr_form">
                    <div class="addr_title">
                        <div style="width:100%; height: 100%; display: flex; align-items: center">경기장 주소</div>
                    </div>
                    <div class="addr_info">
                        <div style="width: 100%; height: 50%; display: flex; align-items: center">
                            <input type="text" placeholder="경기장 주소" name="game_addr" id="stadium_addr" class="inputform" value="${gameDto.game_addr}" readonly>
                        </div>
                    </div>
                    <div class="button_form">
                        <div style="width: 100%; height: 100%; display: flex; align-items: center">
                            <input type="button" value="주소 찾기" id="addr_button" onclick="Addr_api();">
                        </div>
                    </div>
                </div>
                <div id="game_date_form">
                    <div class="font">경기 날짜</div>
                    <div class="info">
                        <input type="date" name="date" placeholder="날짜 입력" id="game_date">
                    </div>
                </div>
                <div id="game_time_form">
                    <div class="font">경기 시간</div>
                    <div class="info">
                        <div style="width: 400px; height: 100%; display: flex; flex-wrap: wrap">
                            <div style="width: 400px; height: 100%; display: flex; align-items: center;">
                                <input type="time" class="time_form" name="game_time">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="game_player_form">
                    <div class="font">팀 인원</div>
                    <div class="info">
                        <select name="game_people" style="width: 258px; height: 35px">
                            <option value="선택">인원</option>
                            <option value="3"  <c:if test="${gameDto.game_people eq 3}">selected</c:if>>3vs3</option>
                            <option value="4"  <c:if test="${gameDto.game_people eq 4}">selected</c:if>>4vs4</option>
                            <option value="5"  <c:if test="${gameDto.game_people eq 5}">selected</c:if>>5vs5</option>
                            <option value="6"  <c:if test="${gameDto.game_people eq 6}">selected</c:if>>6vs6</option>
                            <option value="7"  <c:if test="${gameDto.game_people eq 7}">selected</c:if>>7vs7</option>
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
                                        <input type="radio" name="mergency_yn" value="Y" class="radio" <c:if test="${gameDto.game_mercenary >= 1}">checked</c:if>>
                                    </div>
                                    <div class="radio_comment">Y</div>
                                </div>
                                <div class="radio_form">
                                    <div class="radio_button">
                                        <input type="radio" name="mergency_yn" value="N" class="radio" <c:if test="${gameDto.game_mercenary eq 0}">checked</c:if>>
                                    </div>
                                    <div class="radio_comment">N</div>
                                </div>
                            </div>
                        </div>
                        <div id="mergency_player_form">
                            <div id="mergency">
                                <div id="mergency_player_title">필요 용병 수</div>
                                <div id="mergency_player_input_form">
                                    <input type="number" placeholder="숫자만 입력, 7까지만" id="player_input" max="7" name="game_mercenary"
                                    <c:choose>
                                    <c:when test="${gameDto.game_mercenary eq 0}"> </c:when>
                                           <c:when test="${gameDto.game_mercenary >= 1}">value="${gameDto.game_mercenary}"</c:when>
                                    </c:choose>
                                    >
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            $(function (){
                                var valuechk = $('.radio:checked').val();
                                if(valuechk === 'Y'){
                                    $('#player_input').attr('disabled', false);
                                    $('#player_input').focus();
                                }
                                else{
                                    $('#player_input').val('');
                                    $('#player_input').attr('disabled', true);
                                }
                            });
                            $('.radio').on('click', function (){
                                var valuechk = $('.radio:checked').val();
                                if(valuechk === 'Y'){
                                    $('#player_input').attr('disabled', false);
                                    $('#player_input').focus();
                                }
                                else{
                                    $('#player_input').val('');
                                    $('#player_input').attr('disabled', true);
                                }
                            });
                        </script>
                    </div>

                </div>
                <div id="game_type_form">
                    <div class="font">경기 타입</div>
                    <div class="info">
                        <div class="radio_form">
                            <div class="radio_button">
                                <input type="radio" name="game_type" value="Y" class="radio_ss">
                            </div>
                            <div class="radio_comment">Y</div>
                        </div>
                        <div class="radio_form">
                            <div class="radio_button">
                                <input type="radio" name="game_type" value="N" class="radio_ss" checked>
                            </div>
                            <div class="radio_comment">N</div>
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
                        <textarea id="textarea" name="game_content">${gameDto.game_content}</textarea>
                    </div>
                </div>
                <div id="button_form"><input type="submit" value="경기 수정" id="button"></div>
            </div>
        </form:form>
    </div>
</section>
<footer>
    푸터
</footer>
</body>
</html>