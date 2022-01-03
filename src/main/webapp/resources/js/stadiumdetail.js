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

function view_review_detail_form(idx, user_id, stadium_no, title, content, date){
    idxs = idx;
    user_ids = user_id;
    stadium_nos = stadium_no;
    rv_update_titles = title;
    rv_update_contents = content;
    rv_update_dates = date;

    $('body').css('background-color', 'gray');
    $('body').css('cursor', 'pointer');
    // document.body.style.backgroundColor = 'gray';
    // document.body.style.cursor = 'pointer';

    $("#bot_review_view_form")
    .css('display', 'block')
    .css('bottom', "550px")
    .css('cursor', 'default');

    $("#review_v_title").empty();
    $("#review_v_content").empty();
    $("#review_v_title").val(rv_update_titles);
    $("#review_v_content").val(rv_update_contents);

    $("input[type=button]").prop('disabled', true);
    $("#review_update").prop('disabled', false);
    $("#review_delete").prop('disabled', false);
    $("#review_update_cancel").prop('disabled', true);
    $("#review_update_ac").prop('disabled', true);

    $("#overlay").fadeIn();
}

function review_update(){
    $("#review_v_title").attr("readonly", false);
    $("#review_v_content").attr("readonly", false);

    $("#review_update_ac").show();
    $("#review_update_cancel").show();
    $("#review_update").hide();
    $("#review_delete").hide();

    $("#review_update").prop('disabled', false);
    $("#review_delete").prop('disabled', false);
    $("#review_update_ac").prop('disabled', false);
    $("#review_update_cancel").prop('disabled', false);
}

function review_delete(){
    alert('delete');
}

function review_update_ac(){
    alert('sdsds');
}

function review_update_cancel(){
    $("#review_update_ac").hide();
    $("#review_update_cancel").hide();
    $("#review_update").show();
    $("#review_delete").show();

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