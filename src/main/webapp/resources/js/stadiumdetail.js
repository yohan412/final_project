var review_insert_form = $("#bot_review_insert_form");
var review_view_form = $("#bot_review_view_form");

$(function (){
    $("#bot_review_insert_form").hide();
    $("#bot_review_view_form").hide();
});

window.onload = function (){
    var textarea =  document.getElementById("content");

    textarea.style.height = "1px";
    textarea.style.height = (12+textarea.scrollHeight)+"px";
}

function view_review_insert_form(){
    $("#bot_review_insert_form").toggle();
}

var idxs;
var user_ids;
var stadium_nos;
var rv_update_titles;
var rv_update_contents;
var rv_update_dates;
var authors;
var review_nos;

function view_review_detail_form(idx, user_id, stadium_no, title, content, date, author, review_no){
    idxs = idx;
    user_ids = user_id;
    stadium_nos = stadium_no;
    rv_update_titles = title;
    rv_update_contents = content;
    rv_update_dates = date;
    authors = author;
    review_nos = review_no;

    $('body').css('background-color', 'gray');
    $('body').css('cursor', 'pointer');
    // document.body.style.backgroundColor = 'gray';
    // document.body.style.cursor = 'pointer';

    $("#content").css("background-color", 'gray');

    $(".bxslider li").css("background-color", "gray");

    $("#bot_review_view_form")
    .css('display', 'block')
    .css('bottom', "550px")
    .css('cursor', 'default');

    $("#review_v_title").empty();
    $("#review_v_content").empty();
    $("#review_v_title").val(rv_update_titles);
    $("#review_v_content").val(rv_update_contents);

    $("input[type=button]").prop('disabled', true);
    $(".review_update").prop('disabled', false);
    $(".review_delete").prop('disabled', false);
    $(".review_update_cancel").prop('disabled', true);
    $(".review_update_ac").prop('disabled', true);

    $("#overlay").fadeIn();
}

function review_update(){
    if(authors != user_ids){
        alert('작성자만 수정이 가능합니다');
    }else{
        $("#review_v_title").attr("readonly", false);
        $("#review_v_content").attr("readonly", false);

        $(".review_update_ac").show();
        $(".review_update_cancel").show();
        $(".review_update").hide();
        $(".review_delete").hide();

        $(".review_update").prop('disabled', false);
        $(".review_delete").prop('disabled', false);
        $(".review_update_ac").prop('disabled', false);
        $(".review_update_cancel").prop('disabled', false);
    }
}

function review_delete(author){
    if(authors != author){
        alert('작성자만 삭제할 수 있습니다');
    }else{
        location.href='review_delete.do?review_no=' + review_nos + '&stadium_no=' + stadium_nos;
    }
}

function review_update_ac(){
    var title = document.getElementById("review_v_title").value;
    var content = document.getElementById("review_v_content").value;

    if(!title || !content) {
        if (!title) {
            alert('제목을 입력하세요');
        }
        if (!content) {
            alert('내용을 입력하세요');
        }
    }else{
        var val = {
            "review_title" : title,
            "review_content" : content,
            "review_no" : review_nos
        };

        $.ajax({
            type:"post",
            url:"/review_update.do",
            data:JSON.stringify(val),
            contentType:"application/json",
            dataType:"json",
            success:function (msg){
                if(msg.check == true){
                    location.href='stadiumdetail.do?stadium_no=' + stadium_nos;
                }else{
                    location.href='stadiumdetail.do?stadium_no=' + stadium_nos;
                }
            },
            error:function (){
                alert('통신 오류');
            }
        })
    }

}

function review_update_cancel(){
    $(".review_update_ac").hide();
    $(".review_update_cancel").hide();
    $(".review_update").show();
    $(".review_delete").show();

    $("#review_v_title").attr("readonly", true);
    $("#review_v_content").attr("readonly", true);

    $("#review_v_title").empty();
    $("#review_v_content").empty();
    $("#review_v_title").val(rv_update_titles);
    $("#review_v_content").val(rv_update_contents);
}

function review_insert(user_id){
    var title = $("#title_input").val();
    var content = $("#rv_text").val();

    if(user_id === "" || user_id == null){
        alert('로그인 후 이용하세요');
        return false;
    }else{
        if(!title || !content){
            if(!title){
                alert('제목을 입력하세요');
                return false;
            }
            if(!content){
                alert('내용을 입력하세요');
                return false;
            }
        }else{
            return true;
        }
    }
}