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
	function idChk() {
		var doc = document.getElementsByName("user_id")[0];
		if(doc.value.trim()==""||doc.value==null){
			alert("아이디를 입력해 주세요.");
		}else{
			var target = "idChk.do?user_id="+doc.value.trim();
			open(target,"","width=200,height=150");
		}
	}
	function idChkConfirm(){
		var chk = document.getElementsByName("user_id")[0].title;
		if(chk=="n"){
			alert("아이디 중복체크");
			document.getElementsByName("user_id")[0].focus();
			return false;
		}
	}
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
	
	function pwchk(){
		var pw1 = document.getElementsByName("user_pw")[0].value;
		var pw2 = document.getElementsByName("user_pw2")[0].value;
		
		if(pw1!=pw2){
			alert("비밀번호 입력 오류");
			return false;
		}
			
		return true;
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
		<form action="register.do" method="post" onsubmit="return pwchk()">
			<table align="center" method="post" cellpadding="3">
				<tr>
					<th>I D</th>
					<td width="100%">
						<input type="text" id="id" name="user_id" title="n" style="width: 250px;" placeholder="아이디를 입력하세요" required="required" autofocus>&nbsp;&nbsp;
						<input type="button" id="id_chk" value="중복 확인" onclick="idChk()">
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<input type="password" id="pw" name="user_pw" size="20" placeholder="비밀번호를 입력하세요" required><br><br>
						<input type="password" id="pw" name="user_pw2" size="20" placeholder="비밀번호 재확인" required>
					</td>
				</tr>
				<tr>
					<th>Name</th>
					<td>
						<input type="text" id="username" name="user_name" style="width: 250px;" size="20" placeholder="이름을 입력하세요" required>&nbsp;&nbsp;
						<select id="gender" name="user_gender" style="width:80px;height:30px;">
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" id="email" size="30" name="user_email" placeholder="이메일을 입력하세요" required></td>
				</tr>
				<tr>
				
				<div id="birth">
					<th>Year / Month / Day</th>
					<td>
						<select id="birth_yy" name="mybirthyy" style="width:90px;height:30px;">
							<option value="0" selected>년</option>
							<option value="1950">1950</option>
							<option value="1951">1951</option>
							<option value="1952">1952</option>
							<option value="1953">1953</option>
							<option value="1954">1954</option>
							<option value="1955">1955</option>
							<option value="1956">1956</option>
							<option value="1957">1957</option>
							<option value="1958">1958</option>
							<option value="1959">1959</option>
							<option value="1960">1960</option>
							<option value="1961">1961</option>
							<option value="1962">1962</option>
							<option value="1963">1963</option>
							<option value="1964">1964</option>
							<option value="1965">1965</option>
							<option value="1966">1966</option>
							<option value="1967">1967</option>
							<option value="1968">1968</option>
							<option value="1969">1969</option>
							<option value="1970">1970</option>
							<option value="1971">1971</option>
							<option value="1972">1972</option>
							<option value="1973">1973</option>
							<option value="1974">1974</option>
							<option value="1975">1975</option>
							<option value="1976">1976</option>
							<option value="1977">1977</option>
							<option value="1978">1978</option>
							<option value="1979">1979</option>
							<option value="1980">1980</option>
							<option value="1981">1981</option>
							<option value="1982">1982</option>
							<option value="1983">1983</option>
							<option value="1984">1984</option>
							<option value="1985">1985</option>
							<option value="1986">1986</option>
							<option value="1987">1987</option>
							<option value="1988">1988</option>
							<option value="1989">1989</option>
							<option value="1990">1990</option>
							<option value="1991">1991</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
							<option value="1995">1995</option>
							<option value="1996">1996</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
							<option value="1999">1999</option>
							<option value="2000">2000</option>
							<option value="2001">2001</option>
							<option value="2002">2002</option>
							<option value="2003">2003</option>
							<option value="2004">2004</option>
							<option value="2005">2005</option>
							<option value="2006">2006</option>
							<option value="2007">2007</option>
							<option value="2008">2008</option>
							<option value="2009">2009</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="birth_mm" name="mybirthmm" style="width:90px;height:30px;">
                            <option value="0" selected> 월 </option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="birth_dd" name="mybirthdd" style="width:90px;height:30px;">
							<option value="0" selected> 일 </option>
							<option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                            <option value="13" >13</option>
                            <option value="14" >14</option>
                            <option value="15" >15</option>
                            <option value="16" >16</option>
                            <option value="17" >17</option>
                            <option value="18" >18</option>
                            <option value="19" >19</option>
                            <option value="20" >20</option>
                            <option value="21" >21</option>
                            <option value="22" >22</option>
                            <option value="23" >23</option>
                            <option value="24" >24</option>
                            <option value="25" >25</option>
                            <option value="26" >26</option>
                            <option value="27" >27</option>
                            <option value="28" >28</option>
                            <option value="29" >29</option>
                            <option value="30" >30</option>
                            <option value="31" >31</option>
						</select>
					</td>
				</tr>
				</div>
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
				<tr class="phone">
					<th>Phone</th>
					
					 <br>
					<td><input type="text" name="user_phone" placeholder="휴대폰 번호를 입력하세요" size="15" required></td>
					<td></td><td></td>
				</tr>
				<tr>
					<td style="font-size:15px;">
						<input type="checkbox" id="chkbox" required><span><a href="javascript:void(0);" onclick="javascript:provision1();">서비스 이용약관 및 운영원칙</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox" required><span><a href="javascript:void(0);" onclick="javascript:provision2();">개인정보 수집 이용</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox" required><span><a href="javascript:void(0);" onclick="javascript:provision3();">위치정보 이용약관</a>에 동의합니다.</span><br>
						<input type="checkbox" id="chkbox" required><span><a href="javascript:void(0);" onclick="javascript:provision4();">프로모션 정보 수신</a>에 동의합니다.</span>
					</td>
					<td></td><td></td>
					<br><br><br><br>
				</tr>
				
				<div>
				<tr>
					<td colspan="10" style="text-align: center;">
						<input type="submit" id="join" value="가 입 하 기"  style="width:300px;height:40px;" onclick="idChkConfirm();"><br><br>
						<input type="button" id="reset" value="취 소" onclick="'" style="width:300px;height:40px;">
					</td>
				</tr>
				</div>
			</table>
		</form>
	</div>
	<footer></footer>
</body>
</html>