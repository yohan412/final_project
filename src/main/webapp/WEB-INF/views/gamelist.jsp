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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>경기 일정 목록</title>
</head>
<body>
<header>
로고
</header>
<section>
    <div id="mainform">
        <div id="titleform">
            <h2>경기 일정 목록</h2>
        </div>
        <div id="listform">
            <c:forEach items="${gamelist}" var="gamelist" varStatus="status">
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
                        <script type="text/javascript">
                            var time = '${starttime}';                         //db에 저장되어있는 경기 시작 시간 선언
                            var timearr = time.split(':');                              //시간하고 분을 분리해 배열에 저장
                            $(function (){
                                var time1 = Number(timearr[0]) + 1;                     //시간 부분을 number타입으로 변환 후 한 시간 더함
                                var time2 = timearr[1];                                 //분 부분을 선언

                                var time3 = time1 + ':' + time2;                        //한 시간 계산하고 다시 합침

                                var times = document.getElementsByClassName("endtime");  //변수 출력할 자리 선언
                                times[${status.index}].innerHTML = time3;                //변수 삽입

                                time = "11:00";
                            });
                        </script>
                        <div class="endtime"></div>
                    </div>
                    <div id="stadium">${gamelist.game_stadium}</div>
                    <script type="text/javascript">
                        //db에 저장되어있는 날짜 시간 구하기
                        var date    = '<fmt:formatDate value="${gamelist.game_date}" pattern="yyyy-MM-dd"/>';   //db에 저장되어있는 경기 날짜
                        var datearr = date.split('-');                                                          //-로 나눈 뒤 배열 저장

                        var time    = '${gamelist.game_time}';
                        var timearr = time.split(':');

                        var year    = Number(datearr[0]);
                        var month   = Number(datearr[1]);
                        var day     = Number(datearr[2]);

                        var hh      = Number(timearr[0]);
                        var mm      = Number(timearr[1]);
                        //현재 시간 구하기
                        var today       = new Date();

                        var today_year  = today.getFullYear();
                        var today_month = today.getMonth() + 1;
                        var today_day   = today.getDate();

                        var today_hh    = today.getHours();
                        var today_mm    = today.getMinutes();

                        //값 출력할 div 태그 선언
                        var div = document.getElementsByClassName("status");

                        $(document).re = function (){
                            //db에 저장되어있는 연도와 현재 연도가 같으면 아래 if문 실행
                            if(year === today_year){
                                //db에 저장되어있는 달과 현재 달이 같으면 아래 if문 실행
                                if(month === today_month){
                                    alert(day - today_day);
                                }
                                //db에 저장되어있는 달과 현재 달보다 크면 다음달에 진행한다는 의미이니 모집중으로 출력
                                else if(month > today_month){
                                    div[${status.index}].innerHTML = '모집중';
                                }
                                //db에 저장되어있는 달이 현재 달보다 작으면 저번달에 이미 진행했다는 의미이니 종료로 출력
                                else if(month < today_month){
                                    div[${status.index}].innerHTML = '종료';
                                }
                            //db에 저장되어있는 연도가 현재 연도보다 크면 내년에 진행한다는 의미이니 모집중으로 출력
                            }else if(year > today_year){
                                div[${status.index}].innerHTML = '모집중';
                            }
                            //db에 저장되어있는 연도가 현재 연도보다 작으면 작년에 이미 진행 했으므로 종료로 출력
                            else if(year < today_year){
                                div[${status.index}].innerHTML = '종료';
                            }
                        };
                    </script>
                    <div id="person">5 vs 5</div>
                    <div id="state" class="status">
                        모집중
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="pagingform">
            <c:if test="${gamepagemaker.prev}">
                <button id="prevbutton" onclick="location.href=''"><a href="gamelist.do${gamepagemaker.makeQuery(gamepagemaker.startPage - 1)}"><</a></button>
            </c:if>
            <c:forEach begin="${gamepagemaker.startPage}" end="${gamepagemaker.endPage}" var="idx">
                <button id="pagingnum"><a href="gamelist.do${gamepagemaker.makeQuery(idx)}">${idx}</a></button>
            </c:forEach>
            <c:if test="${gamepagemaker.next && gamepagemaker.endPage > 0}">
                <button id="nextbutton"><a href="gamelist.do${gamepagemaker.makeQuery(gamepagemaker.endPage + 1)}">></a></button>
            </c:if>
        </div>
        <div id="serchform">
            <div>
                <input type="text" name="serch" id="search">
                <input type="button" id="button" value="검색">
            </div>
        </div>
    </div>
</section>
<footer>
	푸터
</footer>
</body>
</html>