<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
<header>
    헤더
</header>
<section>
    <div id="mainform">
        <%--페이지 타이틀--%>
        <div id="titleform">
            <h2>${gamedto.game_region} - xx 경기장</h2>
        </div>
        <%--상단 내용 구역--%>
        <div id="top_form">
            <%--왼쪽(지도, 모집 관련) 구역--%>
            <div id="left_form">
                <%--지도--%>
                <div id="map_form"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49af48b1cf77792390c26841571e0b1c"></script>
                <script type="text/javascript">
                    var mapContainer = document.getElementById('map_form'), // 지도를 표시할 div
                        mapOption = {
                            center: new kakao.maps.LatLng(37.566436, 126.978686), // 지도의 중심좌표
                            level: 9 // 지도의 확대 레벨
                        };

                    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                    var map = new kakao.maps.Map(mapContainer, mapOption);

                    // 맵 이동 금지
                    map.setDraggable(false);
                    // 맵 확대 축소 금지
                    map.setZoomable(false);
                </script>
                <%--모집 여부--%>
                <div id="mergency_state">
                    <h2 style="width: 150px; display: flex; justify-content: center">모집</h2>
                    <h2 style="width: 150px; display: flex; justify-content: center">N명</h2>
                </div>
            </div>
            <%--오른쪽(경기장 이름, 주소, 날짜 등) 구역--%>
            <div id="right_form">
                <%--경기장 이름 주소 구역--%>
                <div id="addr_form">
					<div id="stadium_form">XX 경기장</div>
                    <div id="stadium_addr_form"><h3>인천광역시 xx시 xx동</h3></div>
                </div>
                <%--날짜 구역--%>
                <div id="date_form">
                    <%--D-day 여부--%>
                    <div id="dday_form">D-Day</div>
                    <%--날짜 구역--%>
                    <div id="date">2021-12-12</div>
                </div>
                <%--시간, 인원 구역--%>
                <div id="time_person_form">
                    <div id="time_form">20:00 ~ 22:00</div>
                    <div id="person_div">
                        <div id="person_form">5 vs 5</div>
                    </div>
                </div>
                <%--기타 내용 구역--%>
               	<textarea id="textarea_form" readonly>fasdf</textarea>
            </div>
            <%--버튼 구역--%>
            <div id="button_form">
                <input type="button" value="수정하기" class="button" onclick="show()">
                <input type="button" value="삭제하기" class="button" onclick="location.href='/gameinsertform.do'">
            </div>
        </div>
        <%--하단 내용 구역--%>
        <div id="bottom_form">
            <%--댓글 구역--%>
            <div id="comment_form">
                <%--댓글 리스트--%>
                <c:forEach begin="1" end="5">
                    <div class="comment">
                        <div id="comment_info">
                            <div id="comment_id">회원 이름</div>
                            <div id="comment_date">2021-12-12</div>
                        </div>
                        <div id="comment_content">ㅎㅎ</div>
                        <div id="comment_delete"><input type="button" value="X" id="comment_button"></div>
                    </div>
                </c:forEach>
                <%--댓글 페이징--%>
                <div id="comment_paging">
		           <button id="prevbutton"><a href="#"><</a></button>
		           <c:forEach begin="1" end="5">
		               <button id="pagingnum"><a href="#">1</a></button>
		           </c:forEach>
		           <button id="nextbutton"><a href="#">></a></button>
                </div>
                <%--댓글 입력 폼--%>
                <div id="comment_insert_form">
                    <div id="comment_insert">
                        <textarea id="search"></textarea>
                        <input type="button" id="button" value="등록">
                    </div>
                </div>
                
            </div>
        </div>
        <%--숨겨진 구역(용병 리스트)--%>
        <div id="hidden_form">
            <%--용병 리스트--%>
            <div id="mergency_list_form">
                <c:forEach begin="1" end="10">
                    <div id="mergency_list">
                        <div id="mergency_id">아이디(이름)</div>
                        <div id="mergency_foot">주발</div>
                        <div id="mergency_position">포지션</div>
                        <div id="mergency_rate">50%</div>
                        <div id="mergency_button_form"><input type="button" value="초대하기" id="mergency_button"></div>
                    </div>
                </c:forEach>
                <div style="width: 700px; height: 40px">

                </div>
            </div>
        </div>
    </div>
</section>
<footer>
<div >
    <div>faq</div>
    <div>qna</div>
</div>
</footer>
</body>
</html>