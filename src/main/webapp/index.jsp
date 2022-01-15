<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Street Futsal Manager</title>
<style type="text/css">
	
	footer{
		width: 100%;
		text-align:center;
		bottom:0;
		margin-bottom: -100px;
		position: absolute;
	}
	
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
	
	#search{
		position: absolute;
		width: 400px;
		height: 45px;
		bottom: 50px;
	}
	
	/* Slideshow container */
	.slideshow-container {
	  width: 1600;
	  height: 400px;
	  position: relative;
	  margin: auto;
	  margin-top: 50px;
	  overflow: hidden;
	  display: flex;
	  justify-content: center;
	}
	
	/* effect */
	.fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 1.5s;
	}
	
	@-webkit-keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	
	@keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	
	/* Next & previous buttons */
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;	
	  width: auto;
	  padding: 16px;
	  margin-top: -22px;
	  color: white;
	  font-weight: bold;
	  font-size: 18px;
	  transition: 0.6s ease;
	  border-radius: 0 3px 3px 0;
	}
	
	/* Position the "next button" to the right */
	.next {
	  right: 50px;
	  border-radius: 3px 0 0 3px;
	}
	.prev{
		left: 50px;
		border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover, .next:hover {
	  background-color: rgba(0,0,0,0.8);
	}
	
	/*==============================================================*/
	
	::selection {
   background: #212129;
}

.search-wrapper {
    position: absolute;
    transform: translate(-50%, -50%);
    top:80%;
    left:50%;
}
.search-wrapper.active {}

.search-wrapper .input-holder {    
    height: 70px;
    width:70px;
    overflow: hidden;
    background: rgba(255,255,255,0);
    border-radius:6px;
    position: relative;
    transition: all 0.3s ease-in-out;
}
.search-wrapper.active .input-holder {
    width:450px;
    border-radius: 50px;
    background: rgba(0,0,0,0.5);
    transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
}
.search-wrapper .input-holder .search-input {
    width:100%;
    height: 50px;
    padding:0px 70px 0 20px;
    opacity: 0;
    position: absolute;
    top:0px;
    left:0px;
    background: transparent;
    box-sizing: border-box;
    border:none;
    outline:none;
    font-family:"Open Sans", Arial, Verdana;
    font-size: 16px;
    font-weight: 400;
    line-height: 20px;
    color:#FFF;
    transform: translate(0, 60px);
    transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
    transition-delay: 0.3s;
}
.search-wrapper.active .input-holder .search-input {
    opacity: 1;
    transform: translate(0, 10px);
}
.search-wrapper .input-holder .search-icon {
    width:70px;
    height:70px;
    border:none;
    border-radius:6px;
    background: #FFF;
    padding:0px;
    outline:none;
    position: relative;
    z-index: 2;
    float:right;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}
.search-wrapper.active .input-holder .search-icon {
    width: 50px;
    height:50px;
    margin: 10px;
    border-radius: 30px;
}
.search-wrapper .input-holder .search-icon span {
    width:22px;
    height:22px;
    display: inline-block;
    vertical-align: middle;
    position:relative;
    transform: rotate(45deg);
    transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
}
.search-wrapper.active .input-holder .search-icon span {
    transform: rotate(-45deg);
}
.search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after {
    position: absolute; 
    content:'';
}
.search-wrapper .input-holder .search-icon span::before {
    width: 4px;
    height: 11px;
    left: 9px;
    top: 18px;
    border-radius: 2px;
    background: #FE5F55;
}
.search-wrapper .input-holder .search-icon span::after {
    width: 14px;
    height: 14px;
    left: 0px;
    top: 0px;
    border-radius: 16px;
    border: 4px solid #FE5F55;
}
.search-wrapper .close {
    position: absolute;
    z-index: 1;
    top:24px;
    right:20px;
    width:25px;
    height:25px;
    cursor: pointer;
    transform: rotate(-180deg);
    transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
    transition-delay: 0.2s;
}
.search-wrapper.active .close {
    right:-50px;
    transform: rotate(45deg);
    transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
    transition-delay: 0.5s;
}
.search-wrapper .close::before, .search-wrapper .close::after {
    position:absolute;
    content:'';
    background: #FE5F55;
    border-radius: 2px;
}
.search-wrapper .close::before {
    width: 5px;
    height: 25px;
    left: 10px;
    top: 0px;
}
.search-wrapper .close::after {
    width: 25px;
    height: 5px;
    left: 0px;
    top: 10px;
}
/*====================================배너 디자인===================================*/
@import url('https://fonts.googleapis.com/css?family=Nunito:400,700');

html,
body {
  height: 100%;
  font-family: "Nunito", sans-serif;
  font-size: 16px;
}

.container {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
}

h3 {
  color: #262626;
  font-size: 17px;
  line-height: 20px;
  font-weight: 700;
  margin-bottom: 2px;
}

p {
  font-size: 17px;
  font-weight: 400;
  line-height: 20px;
  color: #666666;
}
p.small{
	font-size: 14px;
}

.go-corner {
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  width: 32px;
  height: 32px;
  overflow: hidden;
  top: 0;
  right: 0;
  background-color: #00838d;
  border-radius: 0 4px 0 32px;
}

.go-arrow {
  margin-top: -4px;
  margin-right: -4px;
  color: white;
  font-family: courier, sans;
}

.card1 {
  display: block;
  position: relative;
  width: 200px;
  height: 120px;
  background-color: #f2f8f9;
  border-radius: 4px;
  padding: 32px 24px;
  margin: 12px;
  text-decoration: none;
  z-index: 0;
  overflow: hidden;
}

.card1:before{
	content: "";
    position: absolute;
    z-index: -1;
    top: -16px;
    right: -16px;
    background: #00838d;
    height: 32px;
    width: 32px;
    border-radius: 32px;
    transform: scale(1);
    transform-origin: 50% 50%;
    transition: transform 0.25s ease-out;
}

.card1:hover:before{
	transform: scale(21);
}

.card1:hover p{
	transition: all 0.3s ease-out;
    color: rgba(255, 255, 255, 0.8);
}

.card1:hover h3{
	transition: all 0.3s ease-out;
    color: #ffffff;
}

</style>
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	setInterval(nextSlide, 5000); //5초(5000)마다 다음 슬라이드로 넘어감
	
	$.ajax({
		url:"/getgamelist.do",
		type:"post",
		dateType:"text",
		data:{},
		traditional : true,
		success: function(result){
			$(".banner_wraper").html(result);
			
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
			
		},error: function(jqXHR,textStatus,errorThrown){
			alert("ajax에러");
		}
	})
});




//이전 슬라이드
function prevSlide() {
	$(".mySlideDiv").hide(); //모든 div 숨김
	var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
	var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
	
	//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
	$(".mySlideDiv").each(function(index,item){ 
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	//새롭게 나타낼 div의 index
	var newIndex = 0;
    
	if(currentIndex <= 0) {
		//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
		newIndex = allSlide.length-1;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
		newIndex = currentIndex-1;
	}

	//모든 div에서 active 클래스 제거
	$(".mySlideDiv").removeClass("active");
    
	//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
		newIndex = 0;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}

	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();
	
}

	
	//===============================================================================

	//client rolling banner
		
	
	//======================================================================================
	
	function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
        }
}

//검색 기능
function gamesearch(){
	if($(".search-input").val() === "" || $(".search-input").val() == null){
		alert('검색 내용을 입력하세요');
	}else{
		self.location =
				"gamelist.do" + '?page=1&perPageNum=5' +
				"&searchType=t" +
				"&keyword=" + encodeURIComponent($('.search-input').val());
	}
}
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>

	<div class="slideshow-container">
		<div class="mySlideDiv fade active">
			<img src="/img/futsalimg03.jpg"> 
	    </div>
	            
	    <div class="mySlideDiv fade">
	        <img src="/img/futsalimg04.jpg"> 
	    </div>
	     
	    <div class="mySlideDiv fade">
	        <img src="/img/futsalimg05.jpg"> 
	    </div>

		<form role="form" method="get" onsubmit="return false">
		<div class="search-wrapper">
		    <div class="input-holder">
		        <input type="text" class="search-input" placeholder="Type to search" onkeypress="if(event.keyCode===13){gamesearch()}"  />
		        <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
		    </div>
		    <span class="close" onclick="searchToggle(this, event);"></span>
		</div>
		</form>
			
		<a class="prev" onclick="prevSlide()">&#10094;</a>
		<a class="next" onclick="nextSlide()">&#10095;</a>
	            
	</div>
	<br><br>
		<div class="banner_box">
			<div class="banner_wraper">
				
				
				
				
			</div>
		</div>
	<footer><%@ include file="/WEB-INF/views/footer.jsp" %></footer>
	
</body>
</html>