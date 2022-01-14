<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${detail.stadium_name}수정</title>
    <link href='<c:url value="${path}/resources/css/body.css"/>' rel="stylesheet">
    <link href='<c:url value="${path}/resources/css/stadiuminsert.css"/>' rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/stadiuminsert.js"></script>
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
</head>
<body>
<header style="height: 184px">
    <%@ include file="/WEB-INF/views/header.jsp" %>
</header>
<section>
    <div id="mainform">
        <div id="titleform">${detail.stadium_name} 수정</div>
        <form:form action="/stadiumupdate.do" method="post" onsubmit="return sd('${userDto.user_id}')">
            <input type="hidden" name="stadium_no" value="${detail.stadium_no}">
            <div id="top_form">
                <div id="stadium_name_form">
                    <div style="width: 100px; height: 100%"></div>
                    <div class="font">경기장 이름</div>
                    <div class="info">
                        <input type="text" placeholder="경기장 이름" name="stadium_name" id="stadium_name" class="inputform" value="${detail.stadium_name}">
                    </div>
                    <div style="width: 100px; height: 100%"></div>
                </div>
                <div id="stadium_addr_form">
                    <div style="width: 100px; height: 100%"></div>
                    <div class="addr_title">
                        <div class="font">경기장 주소</div>
                    </div>
                    <div class="addr_info">
                        <div style="width: 100%; height: 50%; display: flex; align-items: center">
                            <input type="text" placeholder="경기장 주소" name="stadium_addr" id="stadium_addr" class="inputform" value="${detail.stadium_addr}" readonly>
                        </div>
                    </div>
                    <div class="button_form">
                        <div style="width: 100%; height: 100%; display: flex; align-items: center">
                            <%--<input type="button" value="주소 찾기" id="addr_button" onclick="Addr_api();">--%>
                                <button id="pointer" type="button" onclick="Addr_api();" style="padding: 0.5rem 2rem; margin-left: 10px">주소 찾기</button>
                        </div>
                    </div>
                    <div style="width: 100px; height: 100%"></div>
                </div>
                <div id="stadium_webaddr_form">
                    <div style="width: 100px; height: 100%"></div>
                    <div class="font">경기장 홈페이지 주소</div>
                    <div class="info">
                        <input type="text" placeholder="경기장 홈페이지 주소" name="stadium_webaddr" id="stadium_webaddr" class="inputform" value="${detail.stadium_webaddr}">
                    </div>
                    <div style="width: 100px; height: 100%"></div>
                </div>
                <div id="stadium_phone_form">
                    <div style="width: 100px; height: 100%"></div>
                    <div class="font">경기장 전화번호</div>
                    <div class="info">
                        <input type="text" placeholder="경기장 전화번호" name="stadium_phonenum" id="stadium_phone" class="inputform" value="${detail.stadium_phonenum}">
                    </div>
                    <div style="width: 100px; height: 100%"></div>
                </div>
                <div id="stadium_content_form">
                    <div class="content_title_form">
                        <div style="width: 100px; height: 100%"></div>
                        <div id="content_title">
                            기타 내용
                        </div>
                        <div style="width: 520px; height: 100%"></div>
                    </div>
                    <div id="content_textarea_form">
                        <div style="width: 100px; height: 100%"></div>
                        <div id="textarae_form">
                            <textarea id="textarea" name="stadium_content"  style="font-family: NexonFootballGothic">${detail.stadium_content}</textarea>
                        </div>
                        <div style="width: 100px; height: 100%"></div>
                    </div>
                </div>
 <%--               <div id="stadium_upload_form">
                    <div style="width: 100px; height: 100%"></div>
                    <div>
                        <div class="font">경기장 사진 업로드</div>
                    </div>
                    <div class="info">업로드 기능 공간</div>
                    <div style="width: 100px; height: 100%"></div>
                </div>--%>
                <div id="button_form" style="margin-top: 50px">
                    <%--<input type="submit" value="경기장 수정" id="button">--%>
                    <button id="pointer" type="submit" style="margin-right: 5px; margin-left: 5px; padding: 1.5rem 5rem;">경기장 수정</button>
                </div>
            </div>
        </form:form>
    </div>
</section>
<footer>
    <%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
</body>
</html>