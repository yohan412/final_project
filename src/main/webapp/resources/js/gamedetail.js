$(function (){
    $("#hidden_form").hide();
    $(".reply_comment_form").hide();
});

function show(){
    $("#hidden_form").show();
};

function replyshow(a){
    $(".reply_comment_form").eq(a).toggle();
}
