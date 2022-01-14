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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript">
        var $bx = jQuery.noConflict();
    </script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
        textarea{
            font-family: 'NexonFootballGothic';
        }
    </style>

    <script type="text/javascript">
        $(function (){
            $bx('.bxslider').bxSlider({
                pager : true,
                controls : true,
                infiniteLoop: true
            });
        });
    </script>
    <style>
        .bx-wrapper img {
            max-width: 500px;
            height: 300px;
            display: block;
        }
        .bxslider li{
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
<header style="height: 184px">
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <div id="titleform">${detail.stadium_name}</div>
        <div id="top_form">
            <div id="top_left_form">
                <div id="img_form">
                    <c:choose>
                        <c:when test="${empty imglist}">
                            이미지가 없습니다.
                        </c:when>
                        <c:otherwise>
                            <ul class="bxslider">
                                <c:forEach items="${imglist}" var="imglist">
                                    <li><img src="/upload/${imglist.pic_path}"></li>
                                </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div id="content_form">
                    <textarea id="content" readonly  style="font-family: NexonFootballGothic">${detail.stadium_content}</textarea>
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
                <div class="info" style="border-bottom: 1px solid lightgrey; box-sizing: border-box;">
                    <div class="mid_title">
                        <div style="height: 100%; width: 109px;"></div>
                        <div style="height: 100%; width: 120px; display: flex; align-items: center; border-right: 1px solid lightgray; box-sizing: border-box">
                            경기장 주소
                        </div>
                    </div>
                    <div class="mid_info">
                        ${detail.stadium_addr}
                    </div>
                </div>
                <div class="info" style="border-bottom: 1px solid lightgrey; box-sizing: border-box;">
                    <div class="mid_title">
                        <div style="height: 100%; width: 109px;"></div>
                        <div style="height: 100%; width: 120px; display: flex; align-items: center; border-right: 1px solid lightgray; box-sizing: border-box">
                            홈페이지 주소
                        </div>
                    </div>
                    <div class="mid_info">
                        <c:choose>
                            <c:when test="${empty detail.stadium_webaddr}">없음</c:when>
                            <c:otherwise>${detail.stadium_webaddr}</c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="info" style="margin-bottom: 0px;">
                    <div class="mid_title">
                        <div style="height: 100%; width: 109px;"></div>
                        <div style="height: 100%; width: 120px; display: flex; align-items: center; border-right: 1px solid lightgray; box-sizing: border-box">
                            전화번호
                        </div>
                    </div>
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
<%--                        <c:forEach begin="0" end="4" varStatus="status">--%>
                            <div class="review_list" onclick="view_review_detail_form(${status.index},'${userDto.user_id}', ${detail.stadium_no}, '${review.review_title}','${review.review_content}','<fmt:formatDate value="${review.review_reg}" pattern="yyyy-MM-dd"/>','${review.user_id}', ${review.review_no})">
                                <input type="hidden" value="${status.index}" class="idx">
                                <div class="review_id">${review.user_id}</div>
                                <div class="review_title"><span>${review.review_title}</span></div>
                                <div class="review_regdate"><fmt:formatDate value="${review.review_reg}" pattern="yyyy-MM-dd"/></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div id="review_paging_form">
                        <c:if test="${reviewpagemaker.prev}">
                            <input type="button" class="buttonsd" id="prevbutton" onclick="location.href='stadiumdetail.do${reviewpagemaker.makeQuery(reviewpagemaker.startPage - 1)}&stadium_no=${detail.stadium_no}'" value="<">
                        </c:if>
                        <c:forEach begin="${reviewpagemaker.startPage}" end="${reviewpagemaker.endPage}" var="idx">
                            <input type="button" class="buttonsd" id="pagingnum" onclick="location.href='stadiumdetail.do${reviewpagemaker.makeQuery(idx)}&stadium_no=${detail.stadium_no}'" value="${idx}">
                        </c:forEach>
                        <c:if test="${reviewpagemaker.next && reviewpagemaker.endPage > 0}">
                            <input type="button" class="buttonsd" id="nextbutton" onclick="location.href='stadiumdetail.do${reviewpagemaker.makeQuery(reviewpagemaker.endPage + 1)}&stadium_no=${detail.stadium_no}'" value=">">
                        </c:if>
                    </div>
                </div>
                <div id="review_button_form">
                    <%--<input type="button" value="리뷰 작성" id="review_insert" class="buttons" onclick="view_review_insert_form()">--%>
                    <button id="pointer" type="button" onclick="view_review_insert_form();" style="padding: 0.5rem 1.5rem; margin-right: 20px; margin-bottom: 5px;">리뷰 작성</button>
                </div>
            </div>
            <div id="bot_right_form">
                <div style="width: 100%; height: 350px"></div>
                <div id="button_form">
                    <div style="width: 25px; height: 100%"></div>
                    <div id="update_button_form">
                        <%--<input type="button" value="수정" class="buttons" id="updatebtn" onclick="location.href='stadiumupdateform.do?stadium_no=${detail.stadium_no}'">--%>
                            <button id="pointer" type="button" onclick="location.href='stadiumupdateform.do?stadium_no=${detail.stadium_no}'" style="padding: 0.5rem 1.2rem;">수정</button>
                    </div>
                    <div id="delete_button_form">
                        <%--<input type="button" value="삭제" class="buttons" id="deletebtn" onclick="location.href='stadiumdelete.do?stadium_no=${detail.stadium_no}'">--%>
                            <button id="pointer" type="button" onclick="location.href='stadiumdelete.do?stadium_no=${detail.stadium_no}'" style="padding: 0.5rem 1.2rem;">삭제</button>
                    </div>
                    <div id="list_button_form">
                        <%--<input type="button" value="목록" class="buttons" onclick="location.href='stadiumlist.do'">--%>
                            <button id="pointer" type="button" onclick="location.href='stadiumlist.do'" style="padding: 0.5rem 1.2rem;">목록</button>
                    </div>
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
        </div>
        <div id="bot_review_view_form" class="review_sd">
            <div id="review_view_form">
                <input type="hidden" name="stadium_no" value="${detail.stadium_no}">
                <input type="hidden" name="user_id" value="${userDto.user_id}">
                <div id="review_view_title">
                    <div class="rv_title">제목</div>
                    <div class="rv_input_form" id="review_v_title_input"><input type="text" name="review_title" id="review_v_title" readonly></div>
                </div>
                <div id="review_content">
                    <div class="rv_title">내용</div>
                    <div class="rv_input_form" id="review_v_content_input"><textarea style="font-family: NexonFootballGothic" name="review_content" id="review_v_content" readonly></textarea></div>
                </div>
                <div id="review_view_button_form">
                    <div style="width: 600px; height: 100%"></div>
                    <div class="rv_buttons_form">
                        <%--<input type="button" class="buttons" id="review_update" value="수정" onclick="review_update();" style="margin-right: 10px">--%>
                        <button id="pointer" class="review_update" type="button" onclick="review_update();" style="padding: 0.5rem 1.2rem; margin-right: 10px">수정</button>
                        <%--<input type="button" class="buttons" id="review_delete" value="삭제" onclick="review_delete('${userDto.user_id}');" style="margin-left: 10px">--%>
                        <button id="pointer" class="review_delete" type="button" onclick="review_delete('${userDto.user_id}');" style="padding: 0.5rem 1.2rem; margin-left: 10px">삭제</button>
                        <%--<input type="submit" class="buttons" id="review_update_ac" value="수정" style="margin-left: 10px" onclick="review_update_ac()">--%>
                        <button id="pointer" class="review_update_ac" type="submit" onclick="review_update_ac()" style="padding: 0.5rem 1.2rem; margin-right: 30px">수정</button>
                        <%--<input type="button" class="buttons" id="review_update_cancel" value="취소" onclick="review_update_cancel();" style="margin-left: 10px">--%>
                        <button id="pointer" class="review_update_cancel" type="button" onclick="review_update_cancel()" style="padding: 0.5rem 1.2rem; margin-left: 10px">취소</button>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(function (){
                    $(".review_update_ac").hide();
                    $(".review_update_cancel").hide();
                });
            </script>
        </div>
        <script type="text/javascript">
            $(document).ready(function (){
                $('body').on("click", function (e){
                    var form = $("#review_view_form");
                    var id = e.target.getAttribute('id');

                    if(id === 'overlay'){
                        document.body.style.backgroundColor = 'white';
                        document.body.style.cursor = 'default';

                        $("#bot_review_view_form")
                            .css('display', 'none')
                            .css('bottom', "0px");

                        $("#content").css("background-color", 'white');
                        $(".bxslider li").css("background-color", "white");

                        $("#review_v_title").empty();
                        $("#review_v_content").empty();

                        $(".review_update_ac").hide();
                        $(".review_update_cancel").hide();
                        $(".review_update").show();
                        $(".review_delete").show();

                        $("input[type=button]").prop('disabled', false);
                        $(".review_update").prop('disabled', true);
                        $(".review_delete").prop('disabled', true);
                        $(".review_update_ac").prop('disabled', true);
                        $(".review_update_cancel").prop('disabled', true);

                        $("#review_v_title").attr("readonly", true);
                        $("#review_v_content").attr("readonly", true);

                        $("#overlay").fadeOut();
                    }
                });
            })
        </script>
        <div id="bot_bottom">
            <div id="bot_review_insert_form">
                <form:form action="/review_insert.do" method="post" onsubmit="return review_insert('${userDto.user_id}')">
                <input type="hidden" name="stadium_no" value="${detail.stadium_no}">
                <input type="hidden" name="user_id" value="${userDto.user_id}">
                <div id="insert_review_title">
                    <div class="rv_title">제목</div>
                    <div class="rv_input_form"><input type="text" name="review_title" id="title_input"></div>
                </div>
                <div id="insert_review_content">
                    <div class="rv_title">내용</div>
                    <div class="rv_input_form"><textarea name="review_content" id="rv_text"  style="font-family: NexonFootballGothic"></textarea></div>
                </div>
                <div id="review_insert_button_form">
                    <div style="width: 755px; height: 100%"></div>
                    <div class="rv_button_form">
                        <%--<input type="submit" class="buttons" value="입력">--%>
                            <button id="pointer" type="submit" style="padding: 0.5rem 1.2rem; margin-left: 10px">입력</button>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
    </div>
    <div id="overlay" style="position: fixed; width: 100vw; height: 100vh; display: none; z-index: 998"></div>
</section>
<footer><%@ include file="/WEB-INF/views/footer.jsp" %></footer>
</body>
</html>