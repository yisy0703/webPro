const express = require('express'); // express 라이브러리 첨부
const app = express(); // express라이브러리를 이용, 객체 생성

const uri = "mongodb+srv://yisy0703:ftnwLKSfNEPRGMS5@cluster0.rjo9xgd.mongodb.net/?retryWrites=true&w=majority";

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

// '/write' 요청경로(get)가 들어왔을 때 write.html로 가라
app.get('/write', (req, res) => {
  res.sendFile(__dirname + '/write.html');
});
// '/write' 요청경로(post)가 들어왔을 때, 파라미터 정보(title, date)를 DB에 저장
app.use(express.urlencoded({extended : true})); // post방식으로 들어온 req의 파라미터 사용
app.post('/write', (req, res) => {
  console.log(req.body.title);
  console.log(req.body.date);
  console.log(req.body); // josn 형태
  res.sendFile(__dirname + '/write.html');
});