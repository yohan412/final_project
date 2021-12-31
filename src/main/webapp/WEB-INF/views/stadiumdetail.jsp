<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <div id="titleform">${detail.stadium_name}</div>
        <div id="top_form">
            <div id="top_left_form">
                <div id="img_form">

                </div>
                <div id="content_form">
                    <textarea id="content" readonly>${detail.stadium_content}</textarea>
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


                        // 주소-좌표 변환 객체를 생성합니다
                        var geocoder = new kakao.maps.services.Geocoder();

                        // 주소로 좌표를 검색합니다
                        geocoder.addressSearch('${detail.stadium_addr}', function(result, status) {

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
                                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${detail.stadium_name}</div>'
                                });
                                infowindow.open(map, marker);

                                map.setCenter(coords);
                            }
                            else {
                                alert("도로 찾기 실패");
                            }
                        });
                    </script>
                </div>
                <div style="width: 100%; height: 150px;"></div>
            </div>
        </div>
        <div id="mid_form">
            <div id="info_form">
                <div class="info">
                    <div class="mid_title">홈페이지 주소</div>
                    <div class="mid_info">
                        <c:choose>
                            <c:when test="${empty detail.stadium_webaddr}">없음</c:when>
                            <c:otherwise>${detail.stadium_webaddr}</c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="info">
                    <div class="mid_title">전화번호</div>
                    <div class="mid_info">
                        <c:choose>
                            <c:when test="${empty detail.stadium_phonenum}">없음</c:when>
                            <c:otherwise>${detail.stadium_phonenum}</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <div id="bottom_form">
            <div id="bot_left_form">
                <div id="review_form">
                    <div id="review_table">
                        <c:forEach items="${review}" var="review" varStatus="status">
                            <div class="review_list">
                                <div class="review_id">${review.user_id}</div>
                                <div class="review_title"><span>${review.review_title}</span></div>
                                <div class="review_regdate"><fmt:formatDate value="${review.review_reg}" pattern="yyyy-MM-dd"/></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="review_paging_form">
                        <c:if test="${reviewpagemaker.prev}">
                            <input type="button" id="prevbutton" onclick="location.href='stadiumdetail.do${reviewpagemaker.makeQuery(reviewpagemaker.startPage - 1)}'" value="<">
                        </c:if>
                        <c:forEach begin="${reviewpagemaker.startPage}" end="${reviewpagemaker.endPage}" var="idx">
                            <input type="button" id="pagingnum" onclick="location.href='stadiumdetail.do${reviewpagemaker.makeQuery(idx)}'" value="${idx}">
                        </c:forEach>
                        <c:if test="${reviewpagemaker.next && reviewpagemaker.endPage > 0}">
                            <input type="button" id="nextbutton" onclick="location.href='stadiumdetail.do${reviewpagemaker.makeQuery(reviewpagemaker.endPage + 1)}'" value=">">
                        </c:if>
                    </div>
                </div>
                <div id="review_button_form">
                    <input type="button" value="리뷰 작성" id="review_insert" class="buttons">
                </div>
            </div>
            <div id="bot_right_form">
                <div style="width: 100%; height: 350px"></div>
                <div id="button_form">
                    <div style="width: 25px; height: 100%"></div>
                    <div id="update_button_form"><input type="button" value="수정" class="buttons" id="updatebtn" onclick="location.href='stadiumupdateform.do?stadium_no=${detail.stadium_no}'"></div>
                    <div id="delete_button_form"><input type="button" value="삭제" class="buttons" id="deletebtn" onclick="location.href='stadiumdelete.do?stadium_no=${detail.stadium_no}'"></div>
                    <div id="list_button_form"><input type="button" value="목록" class="buttons" onclick="location.href='stadiumlist.do'"></div>
                    <div style="width: 25px; height: 100%"></div>
                    <script type="text/javascript">
                        $(function (){
                            if(${userDto.user_role eq 'ADMIN'}){
                                $("#updatebtn").show();
                                $("#deletebtn").show();
                            }else{
                                $("#updatebtn").hide();
                                $("#deletebtn").hide();
                            }
                        })
                    </script>
                </div>
            </div>
            <div id="bot_bottom">
                <div id="bot_review_insert_form">
                    <div id="insert_review_title">
                        <div class="rv_title">제목</div>
                        <div class="rv_input_form"><input type="text" id="title_input"></div>
                    </div>
                    <div id="insert_review_content">
                        <div class="rv_title">내용</div>
                        <div class="rv_input_form"><textarea id="rv_text"></textarea></div>
                    </div>
                    <div id="review_insert_button_form">
                        <div style="width: 755px; height: 100%"></div>
                        <div id="rv_button_form">
                            <input type="button" class="buttons" value="입력" onclick="review_insert();">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>

</footer>
</body>
</html>