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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/gameinsert.js"></script>
    <script type="text/javascript">
        function sd(){
            var region = $('select[name=game_region]').val();
            var stadium = $('input[name=game_stadium]').val();
            var addr = $('input[name=game_addr]').val();
            var date = $('input[name=game_date]').val();
            var time = $('input[name=game_time]').val();
            var people = $('select[name=game_people]').val();
            var mercenary = $('input[name=game_mercenary]').val();
            var content = $('textarea[name=game_content]').val();
            var type = $('input[name=game_type]:checked').val();

            if(region === '예시' || people === '선택' || !stadium || !addr || !date || !time){
                if(region === '예시'){
                    alert('지역을 선택하세요');
                }
                if(people === '선택'){
                    alert('인원수를 선택하세요');
                }
                if(!stadium){
                    alert("경기장 이름을 입력하세요");
                }
                if(!addr){
                    alert("경기장 주소 확인을 하세요");
                }
                if(!date){
                    alert("경기 날짜를 입력하세요");
                }
                if(!time){
                    alert("경기 시간을 입력하세요");
                }
            }else{
                if(!mercenary){
                    mercenary = 0;
                    alert(mercenary);
                }
                var inputvar = {
                    "user_id" : 'admin',
                    "game_region" : region,
                    "game_stadium" : stadium,
                    "game_addr" : addr,
                    "game_date" : date,
                    "game_time" : time,
                    "game_people" : people,
                    "game_mercenary" : mercenary,
                    "game_content" : content,
                    "game_type" : type
                };
                console.log(inputvar);
                $.ajax({
                    type:"post",
                    url:"/gameinsert.do",
                    data:JSON.stringify(inputvar),
                    contentType:"application/json",
                    dataType:"json",
                    success:function (msg){
                        if(msg.check == true){
                            alert('등록 성공');
                            location.href='gamelist.do';
                        }
                        else{
                            alert('실패');
                        }
                    },
                    error:function (){
                        alert('통신 오류');
                    }
                });
            }
        };
    </script>
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
                        <select name="game_region" style="width: 258px; height: 35px">
                            <option value="예시">지역</option>
                            <option value="서울">서울</option>
                            <option value="경기">경기</option>
                            <option value="인천">인천</option>
                            <option value="강원">강원</option>
                            <option value="충북">충북</option>
                            <option value="충남">충남</option>
                            <option value="전북">전북</option>
                            <option value="전남">전남</option>
                            <option value="경북">경북</option>
                            <option value="경남">경남</option>
                            <option value="제주">제주</option>
                        </select>
                    </div>
                </div>
                <div id="stadium_name_form">
                    <div class="font">경기장 이름</div>
                    <div class="info">
                        <input type="text" placeholder="경기장 이름" name="game_stadium" id="stadium_name" class="inputform">
                    </div>
                </div>
                <div id="stadium_addr_form">
                    <div class="addr_title">
                        <div style="width:100%; height: 100%; display: flex; align-items: center">경기장 주소</div>
                    </div>
                    <div class="addr_info">
                        <div style="width: 100%; height: 50%; display: flex; align-items: center">
                            <input type="text" placeholder="경기장 주소" name="game_addr" id="stadium_addr" class="inputform" readonly>
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
                            <option value="3">3vs3</option>
                            <option value="4">4vs4</option>
                            <option value="5">5vs5</option>
                            <option value="6">6vs6</option>
                            <option value="7">7vs7</option>
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
                                        <input type="radio" name="mergency_yn" value="N" class="radio" checked>
                                    </div>
                                    <div class="radio_comment">N</div>
                                </div>
                            </div>
                        </div>
                        <div id="mergency_player_form">
                            <div id="mergency">
                                <div id="mergency_player_title">필요 용병 수</div>
                                <div id="mergency_player_input_form">
                                    <input type="number" placeholder="숫자만 입력, 7까지만" id="player_input" max="7" name="game_mercenary">
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
                        <textarea id="textarea" name="game_content"></textarea>
                    </div>
                </div>
                <div id="button_form"><input type="button" value="경기 등록" id="button" onclick="sd()"></div>
            </div>
    </div>
</section>
<footer>
    푸터
</footer>
</body>
</html>