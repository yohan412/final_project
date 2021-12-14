<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #stadium-content{
    padding-left: 30px;
    height: 300px;
    position:relative;
    float : left;
        width: 50%;

  }
#stadium-map{
    padding-right: 30px;
    max-height:300px;
    max-width: 300px;
    position: relative;
    float: right;
    width: 45%;

  }
/* 입력 폼 */
.form {
  display: flex;
  flex-direction: column;
}
.form textarea {
  resize: none;
  border: 1px solid #dbdbdb;
  padding: 15px 20px;
  outline: none;
}
.form .submit {
  border: 1px solid #8f8f8f;
  background-color: #8f8f8f;
  color: #fff;
  padding: 5px;
  cursor: pointer;
}
/* 레이아웃 - 댓글 */
.comments {
  border: 1px solid #dbdbdb;
}
.comments .comment {
  border-bottom: 1px solid #dbdbdb;
  padding: 20px;
}
.comments .comment:last-child {
  border-bottom: none;
}

/* 상단 메뉴 */
.top {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.top .username {
  font-weight: bold;
}
.top .utility {
  display: flex;
  flex-direction: row;
  margin-left: auto;
}

/* 하단 메뉴 */
.bottom {
  display: flex;
  flex-direction: row;
  align-items: center;
  list-style: none;
  padding: 0;
  margin: 0;
  text-transform: uppercase;
  letter-spacing: -0.5px;
  font-weight: bold;
  font-size: 14px;
}
.bottom .divider {
  width: 1px;
  height: 20px;
  background-color: #dbdbdb;
  margin: 0 20px;
}
.bottom .menu {
  margin: 0;
  padding: 0;
  color: #bebebe;
}
.bottom .menu.show-reply {
  color: #333;
}
/* 레이아웃 - 답글 */
.replies {
  position: relative;
  background-color: #f2f2f2;
  padding-left: 40px;
  padding-right: 20px;
  padding-bottom: 20px;
}
.replies:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 4px;
  height: 100%;
  background-color: #ddd;
}
.replies .reply {
  padding: 20px 0;
  border-bottom: 1px solid #dbdbdb;
}
.replies .reply:last-of-type {
  border-bottom: none;
}
#root {
  padding-left: 30px;
    height: 200px;
    position:relative;
    float : left;
        width: 50%;
  
}
.stadium-buttons {
    position: absolute;
    bottom: 100px;
    right: 100px;

}


</style>
</head>
<body>
    <%@ include file="./header.jsp"%>
    <main>
        <h2>경기장 상세보기</h2>

    
    <div id="stadium-content">
    
        <img src="./image/oo.jpg">
    <p>
      민주노총이 진보진영에서 나오는 대선 후보를 배타적 지지하기로 결정했다. 민주노총의 단일 후보 혹은 정당에 대한 배타적 지지 결정은 2012년 이후 9년만이다.  당시 민주노총은 19대 총선을 앞두고 통합진보당을 배타적으로 지지했으나 총선 뒤 통합진보당  중앙위원회에서 비례대표 경선을 둘러싸고 폭력사태가 일어나자 이를 철회한 뒤, 배타적 지지 결정을 내린 적이 없다. 그 이전 민주노총은 2000년 창당에서 2008년 분당에 이르기까지 민주노동당을 배타적으로 지지했다. 
    </p>
    </div>
    <div id="stadium-map">
        <img src="./image/다운로드.png" 
            usemap="#stadium-map">
        <map name="stadium-map">
            <area>
        </map>
    </div>
    <div id="root">
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
            너무 좋은 글입니다. 잘 보고 가요 !!
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
            감사합니다!
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
        </div>
        
      </div>
    <div class="stadium-buttons">
        <input type="button" value="수정" onclick="">
        <input type="button" value="삭제" onclick="">
        <input type="button" value="목록" onclick="">
    </div>
    </main>
    
    
</body>
</html>