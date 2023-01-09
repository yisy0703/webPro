// 2.js :동적인 부분
name = prompt("What's your name?", "Hong"); // 취소를 클릭하면 'null' 리턴
if (name != 'null' && name != '') {
    document.write(name + "~ Welcome<br>");
}