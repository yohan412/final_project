<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<c:url value="${path}/resources/css/body.css"/>' rel="stylesheet">
<link href='<c:url value="${path}/resources/css/stadium_detail.css"/>' rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/stadiumdetail.js"></script>
</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <div id="titleform">구리 체육관</div>
        <div id="top_form">
            <div id="top_left_form">
                <div id="img_form">

                </div>
                <div id="content_form">
                    <textarea id="content" readonly>1. David Carlson didn't really like his daughter staying for hours at his house. The house was very
                    3. "MUCKY" describes having a lot of wet soil or dirt. Water can be said to be "MUCKY", as well as ground and people. Dirty can be any dirt and any degree. If I have a slight amount of dirt on my pants, they would be dirty, but not muddy or "MUCKY". They would have to have a lot of dirt for that. Filthy is used when something is extremely dirty. Filthy always means dirty. Dirty does not always mean filthy. Also muddy and "MUCKY" apply to a particular kind of dirty - one that involves mud.
                    3. "MUCKY" describes having a lot of wet soil or dirt. Water can be
                        said to be "MUCKY", as well as ground and people. Dirty can be any dirt and any degree. If I have a slight amount of dirt on my pants, they would be dirty, but not muddy or "MUCKY". They would have to have a lot of dirt for that. Filthy is used when something is extremely dirty. Filthy always means dirty. Dirty does not always mean filthy. Also muddy and "MUCKY" apply to a particular kind of dirty - one that involves mud.</textarea>
                </div>
            </div>
            <div id="top_right_form">
                <div id="map_form">
                    <div id="map"></div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49af48b1cf77792390c26841571e0b1c&libraries=services"></script>
                    <script type="text/javascript">
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new kakao.maps.LatLng(37.566436, 126.978686), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                            };

                        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                        var map = new kakao.maps.Map(mapContainer, mapOption);

/*
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
*/

                    </script>
                </div>
                <div style="width: 100%; height: 150px;"></div>
            </div>
        </div>
        <div id="bottom_form">
            <div id="bot_left_form">
                <div id="review_form">

                </div>
            </div>
            <div id="bot_right_form">
                <div id="button_form">
                    <div id="update_button_form"><input type="button" value="수정"></div>
                    <div id="delete_button_form"><input type="button" value="삭제"></div>
                    <div id="list_button_form"><input type="button" value="목록"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>

</footer>
</body>
</html>