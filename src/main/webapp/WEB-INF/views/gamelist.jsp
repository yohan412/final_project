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
<header style="height: 220px">
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <div id="titleform">
            <h2>경기 일정 목록</h2>
        </div>
        <form role="form" method="get" onsubmit="return false">
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
                                ${endtime[status.index]}
                        </div>
                        <div id="stadium">${gamelist.game_stadium}</div>
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
                    <input type="button" value="경기 등록" onclick="game_insert('${userDto.user_id}')">
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
                    <input type="text" name="search" id="search" value="${gameSearch.keyword}" onkeypress="if(event.keyCode===13){gamesearch()}" >
                    <input type="button" id="button" value="검색">
                    <script type="text/javascript">
                        $(function (){
                           $('#button').click(function (){
                               if($("#search").val() === "" || $("#search").val() == null){
                                    alert('검색 내용을 입력하세요');
                               }else{
                                   self.location =
                                       "gamelist.do" + '${gamepagemaker.makeQuery(1)}' +
                                       "&searchType=t" +
                                       "&keyword=" + encodeURIComponent($('#search').val());
                               }
                           });
                        });

                        function gamesearch(){
                            if($("#search").val() === "" || $("#search").val() == null){
                                alert('검색 내용을 입력하세요');
                            }else{
                                self.location =
                                    "gamelist.do" + '${gamepagemaker.makeQuery(1)}' +
                                    "&searchType=t" +
                                    "&keyword=" + encodeURIComponent($('#search').val());
                            }
                        }
                    </script>
                </div>
            </div>
        </form>
    </div>
</section>
<footer>
	푸터
</footer>
</body>
</html>