$(function (){
    $("#hidden_form").hide();
    $(".reply_comment_form").hide();
});

function replyshow(a){
    $(".reply_comment_form").eq(a).toggle();
}

function move_to_update_form(author, user_id, game_no){
    var dday = $.trim($("#dday_form").text());

    if(user_id == null || user_id === ""){
        alert('경기 등록자만 수정이 가능합니다');
    }else{
        if(author === user_id){
            if(dday === '종료'){
                alert('종료한 경기는 수정이 불가능 합니다.');
            }else if(dday === 'D-Day'){
                alert('당일 경기는 수정이 불가능 합니다');
            }else{
                location.href='/gameupdateform.do?game_no='+game_no;
            }
        }else{
            alert('경기 등록자만 수정이 가능합니다.');
        }
    }
}

function delete_game(author, user_id, game_no){
    if(user_id === "" || user_id == null){
        alert('경기 등록자만 삭제가 가능합니다');
    }else {
        if(author === user_id){
            var chk = confirm('정말로 삭제하실건가요?');

            if(chk){
                location.href='/gamedelete.do?game_no='+game_no;
            }
        }else {
            alert('경기 등록자만 삭제가 가능합니다');
        }
    }

}

function support_game(author_info, user_name){
    if(user_name === "" || user_name == null){
        alert('로그인 후 지원하세요');
    }else{
        // location.href='/gamesupport.do?author=' + author_info + '&user_name=' + user_name;
        alert('전송');
    }
}

function rp_comment_insert(idx, game_no, s_author, s_user_id){
    var author = s_author;  //글 작성자 아이디
    var user_id = s_user_id;          //세션 아이디
    var ask_type = '답변';
    var ask_content = $(".rp_search").eq(idx).val();
    var ask_status = $(".ask_status").eq(idx).val();      //기존은 N
    var ask_no = $(".ask_no").eq(idx).val();
    var ask_gpno = $(".ask_gpno").eq(idx).val();
    var ask_gpsq = $(".ask_gpsq").eq(idx).val();


    if(user_id === "" || user_id == null){
        alert('로그인 후 등록하세요');
    }else{
        if(author === user_id){
            if(ask_status === 'Y'){
                alert('이미 답변한 사항입니다');
            }else{
                if(ask_content == null || ask_content === ""){
                    alert('내용을 입력하세요');
                }else{
                    var comment = {
                        "game_no"   : game_no,               //현재 게시글 번호
                        "ask_type"  : ask_type,                         //답변 상태로 변경
                        "user_id"   : user_id,                          //로그인 중인 아이디
                        "ask_content"   : 'RE : ' + ask_content,        //답글 내용
                        "ask_gpno"      : ask_gpno,     //답글 번호
                        "ask_gpsq"      : ask_gpsq,     //답글 순서
                        "ask_status"    : 'Y'                           //답변 여부
                    }

                    var no = {
                        "ask_no" : ask_no
                    }
                    $.ajax({
                        type: "post",
                        url: "/gamedetail_rp_comment_insert.do",
                        data:JSON.stringify(comment),
                        contentType: "application/json",
                        dataType: "json",
                        success: function (msg){
                            if(msg.check === true){
                                alert('댓글등록 성공');
                                $.ajax({
                                    type:"post",
                                    url:"/rp_comment_update.do",
                                    data: JSON.stringify(no),
                                    contentType:"application/json",
                                    dataType:"json",
                                    success: function (msg){
                                        if(msg.check === true){
                                            alert("수정 성공");
                                            location.href='/gamedetail.do?game_no=' + game_no;
                                        }else{
                                            alert('수정 실패');

                                        }
                                    },
                                    error:function (request, status, error){
                                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                    }
                                });
                            }else{
                                alert('댓글 등록 실패');
                            }
                        },
                        error:function (request, status, error){
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        }
                    });

                }
            }
        }else{
            alert('경기 등록자만 답글을 작성할 수 있습니다');
        }
    }

}

function deletecomment(idx, s_user_id, game_no){
    var comment_user_id = $(".user_id").eq(idx).val();  //댓글 작성자 아이디
    var user_id = s_user_id;              //세션 아이디
    var ask_no = $(".ask_no").eq(idx).val();    //댓글 번호

    var no = {
        "ask_no" : ask_no
    }

    if(user_id === "" || user_id == null){
        alert('비로그인 상태입니다');
    }else{
        if(comment_user_id === user_id){
            $.ajax({
                type:"post",
                url:"/comment_delete.do",
                data:JSON.stringify(no),
                contentType:"application/json",
                dataType:"json",
                success: function (msg){
                    if(msg.check === true){
                        alert("삭제 성공");
                        location.href='/gamedetail.do?game_no=' + game_no;
                    }else{
                        alert("삭제 실패");
                    }
                },
                error:function (request, status, error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }else{
            alert('작성자만 삭제할 수 있습니다');
        }
    }
}

function comment_insert(s_user_id, game_no){
    var user_id = s_user_id;  /*세션 연결 시 변경 예정*/
    var ask_content = document.getElementById("search").value;
    var ask_type = '질문';

    var comment = {
        "game_no" : game_no,
        "user_id" : user_id,
        "ask_content" : ask_content,
        "ask_type" : ask_type
    }

    if(user_id === "" || user_id == null){
        alert('로그인 후 등록하세요');
    }else{
        if(ask_content == null || ask_content === ""){
            alert("내용을 입력하세요")
        }else{
            $.ajax({
                type:"post",
                url:"/gamedetail_comment_insert.do",
                data:JSON.stringify(comment),
                contentType:"application/json",
                dataType:"json",
                success:function (msg){
                    if(msg.check === true){
                        alert('댓글등록 성공');
                        location.href='/gamedetail.do?game_no=' + game_no;
                    }
                    else{
                        alert('댓글 등록 실패');
                    }
                },
                error:function (request, status, error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }
    }


}