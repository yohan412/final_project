<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	th, td{
		display: block;
	}
	td input[type="text"], input[type="password"] {
    	width: 350px; height: 30px;
    	font-size: 0.8rem;
    	border: 1px solid #d1d1d1;
	}
	input[type="button"] {
		margin-left: 1px;
	}
	th {
    	margin: 10px 0 8px;
   		font-size: 1.0rem;
   		font-weight: 400;
    	text-align: left;
	}
	
	#zipcode,#id,#username{
		width : 260px;
	}
	#id_chk,#zip_chk,#join{
	 	width : 80px;
	 	height : 30px;
		background-color:rgb(75, 161, 231);
		border: 1px solid gray;
		border-radius: 5px;
		cursor:pointer;
	}
	#reset{
		cursor:pointer;
		border-radius: 5px;
		border: 1px solid gray;
	}
	#birth{
		size : 180px;
	}
	
	input[type=checkbox]{
		margin-left: 10px;
	}

	input[type="checkbox"] {
	  	width: 18px; 
  		height: 18px; 
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
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	function provision1(){
		var target = "";
		open(target,"","width=900,height=500");
	}
	function provision2(){
		var target = "";
		open(target,"","width=900,height=500");
	}
	function provision3(){
		var target = "";
		open(target,"","width=900,height=500");
	}
	function provision4(){
		var target = "";
		open(target,"","width=900,height=500");
	}
	
</script>
</head>
<body>
	<div style="text-align: center; margin-top: 30px;">
		<a href=""><img src=""></a>
	</div>
	<br><br>
	<hr>
	<div id="wrap" align="center">
		<form action="register.do" method="post" >
			<table align="center" method="post" cellpadding="3">
				<input type="hidden" id="id" name="user_id" value="${user_id }[naver]">
				<input type="hidden" id="pw" name="user_pw" value="${user_pw }" >
				<input type="hidden" id="username" name="user_name" value="${user_name }">
				<input type="hidden" id="usergender" name="user_gender" value="${user_gender }">
				<input type="hidden" id="email" name="user_email" value="${user_email }">
				<input type="hidden" id="userbirth" name="user_birthdate" value="${user_birthdate }">
				<tr>
					<th>Address</th>
					<td>
						<input type="text" id="zipcode" name="user_zip" style="width: 250px;" size="10" placeholder="우편번호" readonly>&nbsp;&nbsp;
						<input type="button" id="zip_chk" value="주소 검색" onclick="zipChk()">
					</td>
					<td>
						<input type="text" id="address1" name="myaddr1" placeholder="주소를 입력하세요" readonly><br><br>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="address2" name="myaddr2" size="60" placeholder="상세 주소를 입력하세요">
						<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
					</td>
				</tr>
				<td style="font-size:15px;">
						<input type="checkbox" id="chkbox" required><span><a href="javascript:void(0);" onclick="javascript:provision1();">서비스 이용약관 및 운영원칙</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox" required><span><a href="javascript:void(0);" onclick="javascript:provision2();">개인정보 수집 이용</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox" required><span><a href="javascript:void(0);" onclick="javascript:provision3();">위치정보 이용약관</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox" required><span><a href="javascript:void(0);" onclick="javascript:provision4();">프로모션 정보 수신</a>에 동의합니다.</span>
				</td>
				<br>
				<tr>
					<td colspan="10" style="text-align: center;">
						<input type="submit" id="join" value="가 입 하 기"  style="width:300px;height:40px;"><br><br>
						<input type="button" id="reset" value="취 소" onclick="'" style="width:300px;height:40px;">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<footer></footer>
</body>
</html>