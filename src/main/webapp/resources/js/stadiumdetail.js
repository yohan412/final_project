window.onload = function (){
    var textarea =  document.getElementById("content");

    textarea.style.height = "1px";
    textarea.style.height = (12+textarea.scrollHeight)+"px";
}