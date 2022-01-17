<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 일정 상세</title>
    <link href='<c:url value="${path}/resources/css/body.css"/>' rel="stylesheet">
    <link href='<c:url value="${path}/resources/css/gamedetail.css"/>' rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/gamedetail.js"></script>
    <link href="https://webfontworld.github.io/NexonFootballGothic/NexonFootballGothic.css" rel="stylesheet">
    <link href="https://webfontworld.github.io/mapo/MapoDPP.css" rel="stylesheet">
    <style>
        section{
            font-family: 'NexonFootballGothic';
        }
        #pointer{
            font-size: 16px;
            font-family: 'NexonFootballGothic';
        }
        select{
            border-radius: 1.5em;
            font-family: 'MapoDPP';
        }
        input{
            font-family: 'NexonFootballGothic';
        }
    </style>
</head>
<body>
<header style="height: 184px">
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <%--페이지 타이틀--%>
        <div id="titleform">
            <h2>${gamedto.game_region} - ${gamedto.game_stadium}</h2>
        </div>
        <%--상단 내용 구역--%>
        <div id="top_form">
            <%--왼쪽(지도, 모집 관련) 구역--%>
            <div id="left_form">
                <%--지도--%>
                <div id="map_form"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49af48b1cf77792390c26841571e0b1c&libraries=services"></script>
                <script type="text/javascript">
                    var mapContainer = document.getElementById('map_form'), // 지도를 표시할 div
                        mapOption = {
                            center: new kakao.maps.LatLng(37.566436, 126.978686), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };

                    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                    var map = new kakao.maps.Map(mapContainer, mapOption);

                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new kakao.maps.services.Geocoder();

                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch('${gamedto.game_addr}', function(result, status) {

                        // 정상적으로 검색이 완료됐으면
                        if (status === kakao.maps.services.Status.OK) {

                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            // 결과값으로 받은 위치를 마커로 표시합니다
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });

                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">${gamedto.game_stadium}</div>'
                            });
                            infowindow.open(map, marker);

                            map.setCenter(coords);
                        }
                        else {
                            alert("도로 찾기 실패");
                        }
                    });

                </script>
                <%--모집 여부--%>
                <div id="mergency_state" onclick="support_game('${status}', '${userDto.user_id}', '${userDto.user_name}' ,'${userDto.user_phone}',${login.user_no },${gamedto.game_no });">
                    <%--<h2 style="width: 150px; display: flex; justify-content: center">${status}</h2>
                    <h2 style="width: 150px; display: flex; justify-content: center; font-size: 10px;">
                        <c:choose>
                            <c:when test="${status eq '종료'}"> </c:when>
                            <c:when test="${status eq '모집안함'}"> </c:when>
                            <c:otherwise>용병 신청하러면 클릭</c:otherwise>
                        </c:choose>
                    </h2>
                    <h2 style="width: 150px; display: flex; justify-content: center">
                        <c:choose>
                            <c:when test="${status eq '종료'}"> </c:when>
                            <c:when test="${status eq '모집안함'}"> </c:when>
                            <c:otherwise>${gamedto.game_mercenary}명</c:otherwise>
                        </c:choose>
                    </h2>--%>
                    <c:choose>
                        <c:when test="${status eq '종료'}">
                            <div style="width: 150px; height: 100px; display: flex; align-items: center; justify-content: center; font-size: 30px;">${status}</div>
                        </c:when>
                        <c:when test="${status eq '모집완료'}">
                            <div style="width: 150px; height: 100px; display: flex; align-items: center; justify-content: center; font-size: 30px;">${status}</div>
                        </c:when>
                        <c:otherwise>
                            <div style="width: 150px; height: 50px; display: flex; align-items: center; justify-content: center; font-size: 40px; margin-top: 20px;">${status}</div>
                            <div style="width: 150px; height: 50px; display: flex; align-items: center; justify-content: center">클릭하여 용병 신청</div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${status eq '종료'}"> </c:when>
                        <c:when test="${status eq '모집완료'}"> </c:when>
                        <c:otherwise><div style="width: 150px; height: 50px; display: flex; align-items: center; justify-content: center; font-size: 20px; margin-top: -10px;">${gamedto.game_mercenary}명</div></c:otherwise>
                    </c:choose>
                </div>
                <script type="text/javascript">
                    window.onload = function (){
                        var status = '${status}';
                        if(status === '종료' || status === '모집완료'){
                            $("#mergency_state").css("background-color", 'lightgray');
                        }else{
                            $("#mergency_state").css("background-color", '#00bafa');
                            $("#mergency_state").css("color", '#ffffff');
                        }
                    }
                </script>
            </div>
            <%--오른쪽(경기장 이름, 주소, 날짜 등) 구역--%>
            <div id="right_form">
                <%--경기장 이름 주소 구역--%>
                <div id="addr_form">
                    <div style="width: 100%; height: 10px"></div>
					<div id="stadium_form">${gamedto.game_stadium}</div>
                    <div id="stadium_addr_form"><h3>${gamedto.game_addr}</h3></div>
                    <div style="width: 100%; height: 10px"></div>
                </div>
                <%--날짜 구역--%>
                <div id="date_form">
                    <%--D-day 여부--%>
                    <div id="dday_form">
                        <c:choose>
                            <c:when test="${ddaychk eq 0}">D-Day</c:when>
                            <c:when test="${ddaychk > 0}">D-${ddaychk}</c:when>
                            <c:when test="${ddaychk <= -1}">종료</c:when>
                        </c:choose>
                    </div>
                    <%--날짜 구역--%>
                    <div id="date">
                        <fmt:formatDate value="${gamedto.game_date}" pattern="yyyy-MM-dd"/>
                    </div>
                </div>
                <%--시간, 인원 구역--%>
                <div id="time_person_form">
                    <div id="time_form">
                        <div style="width: 200px; height: 20px; display: flex; align-items: center; justify-content: center; font-size: 15px ">경기 시간</div>
                        <div style="width: 200px; height: 40px; display: flex; align-items: center; justify-content: center;">
                            ${gamedto.game_time} ~ ${endtime}
                        </div>
                    </div>
                    <div id="person_div">
                        <div id="person_form">
                            <div style="width: 200px; height: 20px; display: flex; align-items: center; justify-content: center; font-size: 15px ">경기 시간</div>
                            <div style="width: 200px; height: 40px; display: flex; align-items: center; justify-content: center; ">
                                <c:choose>
                                    <c:when test="${gamedto.game_people eq 3}">3 vs 3</c:when>
                                    <c:when test="${gamedto.game_people eq 4}">4 vs 4</c:when>
                                    <c:when test="${gamedto.game_people eq 5}">5 vs 5</c:when>
                                    <c:when test="${gamedto.game_people eq 6}">6 vs 6</c:when>
                                    <c:when test="${gamedto.game_people eq 7}">7 vs 7</c:when>
                                </c:choose>
                            </div>

                        </div>
                    </div>
                </div>
                <%--기타 내용 구역--%>
               	<textarea id="textarea_form" readonly style="min-height: 200px; font-family: NexonFootballGothic">${gamedto.game_content}</textarea>
            </div>
            <%--버튼 구역--%>
            <div id="button_form">
                <div style="width: 435px; height: 100%"></div>
                <%--<input type="button" value="수정하기" class="button" onclick="move_to_update_form('${gamedto.user_id}','${userDto.user_id}', ${gamedto.game_no})">--%>
                <div style="width: 155px; height: 60px; display: flex; align-items: center; justify-content: center;">
                    <button id="pointer" type="button" onclick="move_to_update_form('${gamedto.user_id}','${userDto.user_id}', ${gamedto.game_no})" style="padding: 1.2rem 3rem;">수정하기</button>
                </div>
                <%--<input type="button" value="삭제하기" class="button" onclick="delete_game('${gamedto.user_id}','${userDto.user_id}', ${gamedto.game_no})">--%>
                <div style="width: 155px; height: 60px; display: flex; align-items: center; justify-content: center;">
                    <button id="pointer" type="button" onclick="delete_game('${gamedto.user_id}','${userDto.user_id}', ${gamedto.game_no})" style="padding: 1.2rem 3rem;">삭제하기</button>
                </div>
                <%--<input type="button" value="목록" class="button" onclick="location.href='gamelist.do'">--%>
                <div style="width: 155px; height: 60px; display: flex; align-items: center; justify-content: center;">
                    <button id="pointer" type="button" onclick="location.href='gamelist.do'" style="padding: 1.2rem 3.7rem;">목록</button>
                </div>
            </div>
        </div>
        <%--하단 내용 구역--%>
        <div id="bottom_form">
            <%--댓글 구역--%>
            <div id="comment_form">
                <%--댓글 리스트--%>
                <c:forEach items="${commentlist}" var="commentlist" varStatus="status">
                    <div class="comment" onclick="replyshow(${status.index});">
                        <div id="comment_info">
                            <div id="comment_id">${commentlist.user_id}</div>
                            <div id="comment_date"><fmt:formatDate value="${commentlist.ask_reg}"/></div>
                        </div>
                        <div id="comment_content">${commentlist.ask_content}</div>
                        <div id="comment_delete"><input type="button" value="X" id="comment_button" onclick="deletecomment(${status.index}, '${userDto.user_id}', ${gamedto.game_no})"></div>
                    </div>
                    <div class="reply_comment_form">
                        <div id="rp_comment_insert">
                            <textarea class="rp_search"  style="font-family: NexonFootballGothic"></textarea>
                            <input type="button" id="button" value="작성" onclick="rp_comment_insert(${status.index},${gamedto.game_no} ,'${gamedto.user_id}', '${userDto.user_id}')">
                            <input type="hidden" class="user_id" value="${user_id[status.index]}">
                            <input type="hidden" class="ask_status" value="${ask_status[status.index]}">
                            <input type="hidden" class="ask_no" value="${ask_no[status.index]}">
                            <input type="hidden" class="ask_gpno" value="${ask_gpno[status.index]}">
                            <input type="hidden" class="ask_gpsq" value="${ask_gpsq[status.index]}">
                        </div>
                    </div>
                </c:forEach>
                <%--댓글 페이징--%>
                <div id="comment_paging">
                    <c:if test="${gameaskpagemaker.prev}">
                        <button class="buttons" id="prevbutton" onclick="location.href='gamedetail.do${gameaskpagemaker.makeQuery(gameaskpagemaker.startPage - 1)}&game_no=${gamedto.game_no}'"><</button>
                    </c:if>
                    <c:forEach begin="${gameaskpagemaker.startPage}" end="${gameaskpagemaker.endPage}" var="idx">
		               <button class="buttons" id="pagingnum" onclick="location.href='gamedetail.do${gameaskpagemaker.makeQuery(idx)}&game_no=${gamedto.game_no}'">${idx}</button>
		            </c:forEach>
                    <c:if test="${gameaskpagemaker.next && gameaskpagemaker.endPage > 0}">
                        <button class="buttons" id="nextbutton" onclick="location.href='gamedetail.do${gameaskpagemaker.makeQuery(gameaskpagemaker.endPage + 1)}&game_no=${gamedto.game_no}'">></button>
                    </c:if>

                </div>
                <%--댓글 입력 폼--%>
                <div id="comment_insert_form">
                    <div id="comment_insert">
                        <textarea id="search"  style="font-family: NexonFootballGothic"></textarea>
                        <input type="button" id="button" value="등록" onclick="comment_insert('${userDto.user_id}', ${gamedto.game_no})">
                    </div>
                </div>
            </div>
        </div>
        <%--숨겨진 구역(용병 리스트)--%>
        <div id="hidden_form">
            <%--용병 리스트--%>
            <div id="mergency_list_form">
            	<c:choose>
	            	<c:when test = "${empty mDto }">
	            		<div id="mergency_list" style="justify-content: center">
	            			<p>--------- 지원자가 아직 없습니다 ------------</p>
	            		</div>
	                </c:when>
	                <c:otherwise>
		                <c:forEach items="${mDto }" var="mDto">
		                    <div id="mergency_list">
		                        <div id="mergency_id"><a href="mercenary_detail.do?user_no=${mDto.user_no }">${mDto.user_id }</a></div>
		                        <div id="mergency_foot">${mDto.mercenary_foot==null?"일반회원":mDto.mercenary_foot }</div>
		                        <div id="mergency_position">${mDto.mercenary_position }</div>
		                        <div id="mergency_rate">${mDto.mercenary_foot==null?"":mDto.mercenary_rate }</div>
		                        <div id="mergency_button_form">
                                    <%--<input type="button" value="초대하기" id="mergency_button" onclick="send_to_mer('${mDto.user_id}','${gamedto.user_id}')">--%>
                                    <button id="pointer" type="button" onclick="send_to_mer('${mDto.user_id}','${gamedto.user_id}')" style="padding: 0.5rem 1.5rem;">초대하기</button>
                                </div>
		                    </div>
		                </c:forEach>
	                </c:otherwise>
                </c:choose>
                <script type="text/javascript">
                    $(function (){
                        var author = '${gamedto.user_id}';        //글 작성자 아이디
                        var user_id = '${login.user_id}';                  //세션 아이디

                        if (author === user_id){
                            $("#hidden_form").show();
                        }

                    });
                </script>
                <div style="width: 700px; height: 40px">
                </div>
            </div>
        </div>
    </div>
</section>
<footer><%@ include file="/WEB-INF/views/footer.jsp" %></footer>
</body>
</html>