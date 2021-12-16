<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  #s_pic {
  padding-left: 100px;
    height: 300px;
    position:relative;
    float : left;
        width: 50%;

 }  
 #desc {
    padding-left: 100px;
    height: 150px;
    position:relative;
    float : left;
        width: 50%;
  }
#map{
  width: 30%;
    padding-right: 100px;
    height: 300px;
    float:right;
    position:relative;
  }
#post-list {
  padding-left: 100px;
    height: 150px;
    position:relative;
    float : left;
    width: 50%;
}

.stadium-buttons {
  float: right; 
  padding-bottom: 100px;
  padding-right: 100px;
  

}
#form-commentInfo{ 
  width: 100%; 
  padding-left: 100px;
  float :left;
  width: 50;
} 
#comment-count{ 
  margin-bottom: 10px; 
} 
#comment-input{ 
  width: 50%; height: 3.3em; 
} 
#submit{ 
  background-color: lightcoral; 
  width: 5.5em; height: 3.3em;; 
  font-size: 15px; 
  font-weight: bold; 
  color: aliceblue; 
} 
  #voteUp, #voteDown{ 
    width: 3.5em; height: 1.9em;
     background-color: aqua; 
    }
   #comments{ 
     margin-top: 10px; 
    } 
   .eachComment{ 
     width :50%; 
     margin: 10px; 
    padding: 0.5em; 
    border-bottom: 1px solid #c1bcba; 
  } 
    .eachComment .name{ 
      font-size: 1.5em; 
      font-weight: bold;
       margin-bottom: 0.3em; 
      display: flex; 
      justify-content: space-between; 
    } 
      .eachComment .inputValue{ 
        font-size: 1.2em; 
        font-style: italic; 
      } 
      .eachComment .time{ 
        font-size: 0.7em; 
        color: #c1bcba; 
        font-style: oblique; 
        margin-top: 0.5em; 
        margin-bottom: 0.5em; 
      } 
      .eachComment .voteDiv{ 
        display: flex; 
        justify-content: flex-end; 
        } 
        .eachComment .deleteComment{ 
          background-color: red; 
            color: aliceblue; 
      }



</style>
</head>
<body>
    <main>
        <h2>경기장 상세보기</h2>

    
    <div id="stadium-pic">
    
        <img id="s_pic" src="./image/oo.jpg">
        </div>
        <br><br><br><br>
        <div id="stadium-map">
          <img id="map" src="./image/다운로드.png" 
              usemap="#stadium-map">
          <map name="stadium-map">
              <area>
          </map>
      </div>
        <br><br><br><br>
    <div id="stadium-desc">
    <p id="desc">
      민주노총이 진보진영에서 나오는 대선 후보를 배타적 지지하기로 결정했다. 민주노총의 단일 후보 혹은 정당에 대한 배타적 지지 결정은 2012년 이후 9년만이다.  당시 민주노총은 19대 총선을 앞두고 통합진보당을 배타적으로 지지했으나 총선 뒤 통합진보당  중앙위원회에서 비례대표 경선을 둘러싸고 폭력사태가 일어나자 이를 철회한 뒤, 배타적 지지 결정을 내린 적이 없다. 그 이전 민주노총은 2000년 창당에서 2008년 분당에 이르기까지 민주노동당을 배타적으로 지지했다. 
    </p>
    </div>
    
    <br><br><br><br><br>
    <div id="form-commentInfo"> 
      <div id="comment-count">댓글 
        <span id="count">0</span></div>
         <input id="comment-input" placeholder="댓글을 입력해 주세요.">
          <button id="submit">등록</button> </div> 
          <div id=comments> 
            
          </div>


      
    <div class="stadium-buttons">
        <input type="button" value="수정" onclick="">
        <input type="button" value="삭제" onclick="">
        <input type="button" value="목록" onclick="">
    </div>
    </main>
</body>
</html>