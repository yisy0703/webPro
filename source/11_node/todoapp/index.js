const express = require('express'); // express 라이브러리 첨부
const app = express(); // express라이브러리를 이용, 객체 생성

app.listen(8090, function(){
  console.log("listening on 8090");
});

// '/pet'요청경로(post, get, put, delete)가 들어왔을 때 브라우저 화면에 출력할 태그
app.get('/pet', function(req, res){
  res.send('<h2>펫 용품 쇼핑 페이지입니다</h2>');
});
// '/'요청경로(get)가 들어왔을 때, 브라우저 화면에 출력할 html
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.use(express.static('public')); // css, js 등의 static 파일은 public 폴더