<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style type="text/css">
html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	background: #f5f6f7;
}

h5 {
	text-align: center;
}

#wrapper {
	position: relative;
	height: 100%;
}

#content {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}

h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}



#USER_BIRTH DATE_wrap {
	display: table;
	width: 100%;
}

#bir_yy {
	display: table-cell;
	width: 147px;
}

#bir_mm {
	display: table-cell;
	width: 147px;
}

#bir_dd {
	display: table-cell;
	width: 147px;
}

#bir_mm, #bir_dd {
	padding-left: 2%;
}

#phone_wrap {
	display: table;
	width: 100%;
}

#phone_certification {
	display: table-cell;
	width: 70%;
}


select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
	background-size: 20px 8px;
}

.btn_area {
	margin: 30px 0 91px;
}
.button1 {
	background-color: gray;
	color: white;
	border: 3px solid white;
	padding: 18px 0 15px;
	font-size:13px;
	width: 100%;	
}
#button2 {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: white;
	background-color:rgb(75, 161, 231);
	font-size: 20px;
	font-weight: 200;
	border-radius: 10px;
}
</style>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function phonechk(){
		var phonenum = document.getElementsByName("user_phone")[0];
		var phonechkVal = {
				"user_phone":user_phone
		};
		
		
		if(phonenum.value.trim()==""||phonenum.value==null){
			alert("ID 및 PW를 확인해 주세요");
		}else{
			$.ajax({
				type:"post",
				url:"phonechk.do",
				data:JSON.stringify(phonechlVal),
				contentType:"application/json",
				dataType:"json",
				success:function(){
					if(msg.check==true){
						location.href="index.jsp";
					}else{
						$("#loginChk").show();
						$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
					}
				},
				error:function(){
					alert("통신 실패");
				}
			});
	}
	function rannumchk(){
		var rannum = document.getElementsByName("rannum")[0].value;
		var inputnum = document.getElementsByName("inputnum")[0].value;
		
		if(rannum!=inputnum){
			alert("인증번호 오류");
			document.getElementsByName("inputnum")[0].focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<header></header>
	<hr>
	<div id="wrapper">
		<h5>
			가입시 입력하셨던 전화번호를 작성해주세요. <br> 입력하신 전화번호로 인증번호를 발송해 드립니다.
		</h5>
		<div id="content">
		<form action="find_id.do" method="post"  onsubmit="return rannumchk()">
			
			<div>
				<h3 class="join_title">
					<label for="USER_BIRTH DATE">생년월일</label>
				</h3>

				<div id="USER_BIRTH DATE_wrap">
					<div id="bir_yy">
						<span class="box"> 
						<select id="yy" class="sel" name="mybirthyy" value="" required>
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
						</span>
					</div>

					<div id="bir_mm">
						<span class="box"> <select id="mm" class="sel" name="mybirthmm" value="" required>
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>
						</span>
					</div>

					<div id="bir_dd">
						<span class="box"> <select id="dd" class="sel" name="mybirthdd" value="" required>
								<option value="00">일</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
						</select>
						</span>
					</div>

				</div>
			</div>
			<br>
			<br>
			
			<div>
				<h3 class="join_title">
					<label for="USER_EMAIL">E-Mail</label>
				</h3>
				<span class="box int_email">
				 <input type="text" id="email" class="int" maxlength="100" name="user_email" placeholder="이메일 주소 입력">
				</span>
			</div>
			<br>
			<br>
			<div>
				<h3 class="USER_PHONE">
					<label for="USER_PHONE">휴대전화번호</label>
				</h3>
			
				<br>
				
				<span class="box"> 
					<input type="text" id="dd" class="int" name="user_phone" placeholder="전화번호 입력" value="" required="required">
				</span> 
				<br>
				<div id="phone_wrap">
					
					<div id="button1">
						<input type="button" value="인증번호 받기"	class="button1" onclick="phonechk();">
					</div>
					<div id="phone_certification">
					 <span class="box"> 
					 	<input type="text" id="dd" class="int" name="inputnum" placeholder="인증번호 6자리" value="" required="required">
					 	<input type="hidden" name="rannum" value="null">
					</div>
				</div>
			</div>
			
			<br>
			<br>

			<div class="btn_area">
				<button type="submit" id="button2">
					<span>확인</span>
				</button>
				<br><br>
				<button type="button" onclick="'" id="button2" style="background-color: gray;">
					<span>취소</span>
				</button>
			</div>
		</form>
		
	

		</div>

	</div>
	<hr>
	<footer></footer>
</body>
</html>