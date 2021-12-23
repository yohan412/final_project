function Addr_api() {
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
            document.getElementById("stadium_addr").value = roadAddr;

        }
    }).open();
}

function sd(user_id){
    var region = $('select[name=game_region]').val();
    var stadium = $('input[name=game_stadium]').val();
    var addr = $('input[name=game_addr]').val();
    var date = $('input[name=game_date]').val();
    var time = $('input[name=game_time]').val();
    var people = $('select[name=game_people]').val();
    var mercenary = $('input[name=game_mercenary]').val();
    var content = $('textarea[name=game_content]').val();
    var type = $('input[name=game_type]:checked').val();

    if(region === '예시' || people === '선택' || !stadium || !addr || !date || !time){
        if(region === '예시'){
            alert('지역을 선택하세요');
        }
        if(people === '선택'){
            alert('인원수를 선택하세요');
        }
        if(!stadium){
            alert("경기장 이름을 입력하세요");
        }
        if(!addr){
            alert("경기장 주소 확인을 하세요");
        }
        if(!date){
            alert("경기 날짜를 입력하세요");
        }
        if(!time){
            alert("경기 시간을 입력하세요");
        }
    }else{
        if(!mercenary){
            mercenary = 0;
            alert(mercenary);
        }
        var inputvar = {
            "user_id" : user_id,
            "game_region" : region,
            "game_stadium" : stadium,
            "game_addr" : addr,
            "game_date" : date,
            "game_time" : time,
            "game_people" : people,
            "game_mercenary" : mercenary,
            "game_content" : content,
            "game_type" : type
        };
        console.log(inputvar);
        $.ajax({
            type:"post",
            url:"/gameinsert.do",
            data:JSON.stringify(inputvar),
            contentType:"application/json",
            dataType:"json",
            success:function (msg){
                if(msg.check == true){
                    alert('등록 성공');
                    location.href='gamelist.do';
                }
                else{
                    alert('실패');
                }
            },
            error:function (){
                alert('통신 오류');
            }
        });
    }
};