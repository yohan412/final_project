<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
img{
    padding-left: 100px;
    height: 150px;
    position:relative;
    float : left;
        width: 30%;
}
p{
    width: 50%;
    padding-right: 100px;
    height:150px;
    float:right;
    position:relative;

}

input[type="button"] {
    position: fixed;
    bottom: 100px;
    right: 100px;

}


h2{
    text-align: center;
}
#search-box-stadium {
    position: relative;
    margin: 0 auto;
    text-align: center;
}



</style>
</head>
<body>
    <%@ include file="./header.jsp"%>
    <main>
    <h2>경기장 목록</h2><br><br>
    <div id="search-box-stadium">
        <form action="" method="">
            <input type="hidden" name="command" value="searchMain">
            <input type="text" name="keyword" style=" width:700px; 
            height: 30px; ">&nbsp;&nbsp;
            <input type="submit" value="검색">

            
        </form>
    </div>
    <br><br>
    
    <div id="stadium">
        <ul class="image-list">
            <c:choose>
                <c:when test="">
                    <img src="./image/당언.jpg">
                    <p>
                        민주노총이 진보진영에서 나오는 대선 후보를 배타적 지지하기로 결정했다.
                         민주노총의 단일 후보 혹은 정당에 대한 배타적 지지 결정은 2012년 이후 9년만이다.
                          당시 민주노총은 19대 총선을 앞두고 통합진보당을 배타적으로 지지했으나 총선 뒤 통합진보당 
                         중앙위원회에서 비례대표 경선을 둘러싸고 폭력사태가 일어나자 이를 철회한 뒤, 배타적 지지 결정을 
                         내린 적이 없다. 그 이전 민주노총은 2000년 창당에서 2008년 분당에 이르기까지 민주노동당을 
                         배타적으로 지지했다. 
                            </p>
                </c:when>
                <c:otherwise>
                    <c:forEach>

                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    <div id="stadium-content">
        <ul class="content=list">
            <c:choose>
                <c:when test="">
                    
                </c:when>
                <c:otherwise>
                    <c:forEach>

                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    
    </main1>
    <input type="button" value="글쓰기" onclick="">
    
    
</body>
</html>