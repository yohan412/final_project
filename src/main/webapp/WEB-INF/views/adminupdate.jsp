<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th, td{
	dispaly: inline-block;
	font-size: 0.8rem;
}
td input[type="text"]{
	width: 200px; height:30px;
	border: 1px solid #d1d1d1;
}
th{
    margin: 10px 0 8px;
   	font-size: 1.0rem;
   	font-weight: 400;
    text-align: left;
}	
td input[type="button"],[type="submit"]{ 
   	background-color:rgb(75, 161, 231);
   	border: 1px solid gray;
    cursor: pointer;
    width: 80px; height: 30px;
}
table.type04 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
table.type04 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function zipChk() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("address1").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
	<div style="text-align: center;">	
		<h2>회원 정보 수정</h2>
	</div>
	<div class="user_update" align="center">
		<form action="aupdateres.do" method="post">
			<input type="hidden" name="user_id" value="${aDto.user_id }">
			<table class="type04" align="center" method="post">
				<tr>
					<th>아이디</th>
					<td>${aDto.user_id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${aDto.user_name }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${aDto.user_gender }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${aDto.user_birthdate }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="user_email" value="${aDto.user_email }"></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><input type="text" name="user_phone" value="${aDto.user_phone }"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" id="zipcode" name="user_zip" value="${aDto.user_zip }" readonly>&nbsp;&nbsp;
						<input type="button" id="zip_chk" value="주소 검색" onclick="zipChk()">
					</td>
				<tr>
					<th></th>
					<td>
						<input type="text" id="address1" name="myaddr3" value="${myaddr3 }" readonly><br><br>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="address2" name="myaddr4" size="50" value="${myaddr4 }">
						<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="hidden" id="sample4_extraAddress" placehol0der="참고항목">
					</td>
				</tr>
				<tr>
					<td colspan="10" style="text-align: right;">
						<input type="submit" value="완료">
						<input type="button" value="취소" onclick="location.href='index.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<footer>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer>
</body>
</html>