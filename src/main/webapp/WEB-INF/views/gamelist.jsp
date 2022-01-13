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
<style type="text/css">
	#map {
	width: 700px;
	height: 400px;
	display: inline-block;
	border: 1px solid black;
	border-radius: 20px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49af48b1cf77792390c26841571e0b1c&libraries=services"></script>
<script type="text/javascript">

//map, gamelist,piclist 는 다른 함수에도 필요하여 전역변수로 선언
var map;
var locmarker;
//실제로 CenterBoard에 표현되는 리스트들
var boardlist;

//지도 생성하는 과정
window.onload = function() {
	var mapContainer = document.getElementById('map'); //지도를 표시할 div
	var mapOption = {
		center : new kakao.maps.LatLng(37.498095, 127.027610), //지도의 중심 좌표
		level : 9
	//지도 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

	
	for(var i=0;i<5;i++){
		
		var addr=document.getElementsByClassName("addr")[i].value;
		var stadium=document.getElementsByClassName("stadium")[i].value;
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {

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
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+stadium+'</div>'
                });
                infowindow.open(map, marker);

	            map.setCenter(coords);
	        }
	        else {
	            alert("도로 찾기 실패");
	        }
	    });
	}
	
}

	
</script>
<title>경기 일정 목록</title>
</head>
<body>
<header style="height: 184px">
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <div id="map">
        
        </div>
        <div id="titleform">
            <h2>경기 일정 목록</h2>
        </div>
        <form role="form" method="get" onsubmit="return false">
            <div id="listform">
                <c:forEach items="${gamelist}" var="gamelist" varStatus="status">
                	<input type="hidden" class="addr" value="${gamelist.game_addr }">
                    <div class="list" onclick="location.href='gamedetail.do?game_no=${gamelist.game_no}'">
                        <div id="region">${gamelist.game_region}</div>
                        <div id="date">
                            <div id="date_status">
                                <c:choose>
                                    <c:when test="${ddaychk[status.index] eq 0}">D-Day</c:when>
                                    <c:when test="${ddaychk[status.index] > 0}">D-${ddaychk[status.index]}</c:when>
                                    <c:when test="${ddaychk[status.index] <= -1}">종료</c:when>
                                </c:choose>
                            </div>
                            <div id="date_info"><fmt:formatDate value="${gamelist.game_date}" pattern="yyyy-MM-dd"/></div>
                        </div>
                        <div id="time">
                            <fmt:parseDate value="${gamelist.game_time}" var="starttime" pattern="HH:mm"/>
                            <fmt:formatDate value="${starttime}" pattern="HH:mm"/>
                            ~&nbsp;
                                ${endtime[status.index]}
                        </div>
                        <div id="stadium" class="stadium" value="${gamelist.game_stadium}">${gamelist.game_stadium}</div>
                        <div id="person">
                            <c:choose>
                                <c:when test="${gamelist.game_people eq 3}">3 vs 3</c:when>
                                <c:when test="${gamelist.game_people eq 4}">4 vs 4</c:when>
                                <c:when test="${gamelist.game_people eq 5}">5 vs 5</c:when>
                                <c:when test="${gamelist.game_people eq 6}">6 vs 6</c:when>
                                <c:when test="${gamelist.game_people eq 7}">7 vs 7</c:when>
                            </c:choose>
                        </div>
                        <div id="state" class="status">
                                ${statuses[status.index]}
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div id="pagingform">
                <div style="width: 200px; height: 100%"></div>
                <div style="width: 500px; height: 100%; display: flex; align-items: center; justify-content: center">
                    <c:if test="${gamepagemaker.prev}">
                        <input type="button" id="prevbutton" onclick="location.href='gamelist.do${gamepagemaker.makeSearch(gamepagemaker.startPage - 1)}'" value="<">
                    </c:if>
                    <c:forEach begin="${gamepagemaker.startPage}" end="${gamepagemaker.endPage}" var="idx">
                        <input type="button" id="pagingnum" onclick="location.href='gamelist.do${gamepagemaker.makeSearch(idx)}'" value="${idx}">
                    </c:forEach>
                    <c:if test="${gamepagemaker.next && gamepagemaker.endPage > 0}">
                        <input type="button" id="nextbutton" onclick="location.href='gamelist.do${gamepagemaker.makeSearch(gamepagemaker.endPage + 1)}'" value=">">
                    </c:if>
                </div>
                <div style="width: 200px; height: 100%; display: flex; align-items: center; justify-content: center">
                    <input type="button" value="경기 등록" onclick="game_insert('${userDto.user_id}')" id="sta_but">
                    <script type="text/javascript">
                        function game_insert(user_id){
                            if(user_id === "" || user_id == null){
                                alert('회원만 경기 등록이 가능합니다');
                            }else{
                                location.href='/gameinsertform.do';
                            }
                        }
                    </script>
                </div>
            </div>
            <div id="serchform">
                <div>
<%--                    <input type="text" name="search" id="search" value="${gameSearch.keyword}" onkeypress="if(event.keyCode===13){gamesearch()}" >
                    <input type="button" id="button" src="/">--%>
                    <input type="text" id="keywordInput" name="keyword"  value="${gameSearch.keyword}" onkeypress="if(event.keyCode===13){gamesearch()}" required=""/>
                    <label alt='검색어를 입력하세요' placeholder=''></label>
                    <input type="image" id="searchBtn" src="img/icon_magnifier.png" onclick="gamesearch();">
                    <script type="text/javascript">
                        $(function (){
                           $('#button').click(function (){
                               if($("#keywordInput").val() === "" || $("#keywordInput").val() == null){
                                    alert('검색 내용을 입력하세요');
                               }else{
                                   self.location =
                                       "gamelist.do" + '${gamepagemaker.makeQuery(1)}' +
                                       "&searchType=t" +
                                       "&keyword=" + encodeURIComponent($('#keywordInput').val());
                               }
                           });
                        });

                        function gamesearch(){
                            if($("#keywordInput").val() === "" || $("#keywordInput").val() == null){
                                alert('검색 내용을 입력하세요');
                            }else{
                                self.location =
                                    "gamelist.do" + '${gamepagemaker.makeQuery(1)}' +
                                    "&searchType=t" +
                                    "&keyword=" + encodeURIComponent($('#keywordInput').val());
                            }
                        }
                    </script>
                </div>
            </div>
        </form>
    </div>
</section>
<footer><%@ include file="/WEB-INF/views/footer.jsp" %></footer>
</body>
</html>