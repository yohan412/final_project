<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%@ include file="./header.jsp"%>
    <main>
        <h2>경기장 상세보기</h2>

    </main>
    <div class="stadium-content">
    <div class="stadium-image">
        <img src="">
    </div>
    <p class="stadium-content"></p>
    </div>
    <div class="stadium-map">
        <img src="" 
            usemap="#stadium-map">
        <map name="stadium-map">
            <area>
        </map>
    </div>
    <form class="form comment-form">
        <textarea placeholder="Comment"></textarea>
        <button type="button" class="submit">등록하기</button>
      </form>
      <div class="comments">
        <div class="comment">
          <div class="content">
            <header class="top">
              <div class="username">우연히 들어온 사람</div>
              <div class="utility">
                <button class="menu">수정</button>
                <button class="menu">메뉴</button>
              </div>
            </header>
            <p>너무 좋은 글입니다. 잘 보고 가요 !!</p>
            <ul class="bottom">
              <li class="menu time">3 days ago</li>
              <li class="divider"></li>
              <li class="menu show-reply">show replies (1)</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="replies">
        <div class="reply">
          <div class="content">
            <header class="top">
              <div class="username">관리자</div>
              <div class="utility">
                <button class="menu">메뉴</button>
              </div>
            </header>
            <p>감사합니다!</p>
            <ul class="bottom">
              <li class="menu time">3 days ago</li>
            </ul>
          </div>
        </div>
        <form class="form reply-form">
          <textarea placeholder="Reply"></textarea>
          <button type="button" class="submit">등록하기</button>
        </form>
      </div>
    <div class="stadium-buttons">
        <input type="button" value="수정" onclick="">
        <input type="button" value="삭제" onclick="">
        <input type="button" value="목록" onclick="">
    </div>
    
    
</body>
</html>