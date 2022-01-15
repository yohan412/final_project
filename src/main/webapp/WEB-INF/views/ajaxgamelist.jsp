<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.banner_box{
		display: flex;
		 justify-content: center; 
	}
	
	.banner_wraper {
		 width: 90%; 
		 height: 180px;
		 position: absolute; 
		 overflow: hidden;
	 }
	
	.banner_list {
		position: absolute;
	}
</style>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//client rolling banner
window.onload = function() {
	var bannerLeft=0;
	var first=1;
	var last;
	var listCnt=0;
	var $list = $(".banner_list");
	var $first;
	var $last;
	
	$list.each(function(){   // 5px 간격으로 배너 처음 위치 시킴
	    $(this).css("left",bannerLeft);
	    bannerLeft += $(this).width()+5;
	    $(this).attr("id", "banner"+(++listCnt));  // img에 id 속성 추가
	});
	
	
	if( listCnt > 5){                //배너 5개 이상이면 이동시킴
	
	    last = listCnt;
	
	    setInterval(function() {
	        $list.each(function(){
	            $(this).css("left", $(this).position().left-1); // 1px씩 왼쪽으로 이동
	        });
	        $first = $("#banner"+first);
	        $last = $("#banner"+last);
	        if($first.position().left < -200) {    // 제일 앞에 배너 제일 뒤로 옮김
	            $first.css("left", $last.position().left + $last.width()+5 );
	            first++;
	            last++;
	            if(last > listCnt) { last=1; }   
	            if(first > listCnt) { first=1; }
	        }
	    }, 50);   //여기 값을 조정하면 속도를 조정할 수 있다.(또는 1px 이동하는 부분도 조정) 
	
	
	}

};
</script>
</head>
<body>
	<c:forEach items="${gamelist}" var="gamelist" varStatus="status">
	<div class="banner_list">
		<div class="container">
			<a class="card1" href="gamedetail.do?game_no=${gamelist.game_no}">
				<h3><fmt:formatDate value="${gamelist.game_date}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${gamelist.game_mercenary>0?"모집중":"모집완료"}</h3>
				<p class="small"> ${gamelist.game_region} ${gamelist.game_stadium}</p>
				<p>
					<fmt:parseDate value="${gamelist.game_time}" var="starttime" pattern="HH:mm"/>
                            <fmt:formatDate value="${starttime}" pattern="HH:mm"/>
                           	&nbsp;~&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:choose>
                    	<c:when test="${gamelist.game_people eq 3}">3 vs 3</c:when>
                      	<c:when test="${gamelist.game_people eq 4}">4 vs 4</c:when>
                      	<c:when test="${gamelist.game_people eq 5}">5 vs 5</c:when>
                      	<c:when test="${gamelist.game_people eq 6}">6 vs 6</c:when>
                 	  	<c:when test="${gamelist.game_people eq 7}">7 vs 7</c:when>
                    </c:choose>
				</p>
				<div class="go-corner" href="#">
					<div class="go-arrow">
						→
					</div>
				</div>
			</a>
		</div>
	</div>
	</c:forEach>
</body>
</html>