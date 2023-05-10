const express = require('express'); // express 라이브러리 첨부
const app = express(); // express라이브러리를 이용, 객체 생성

const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://yisy0703:ftnwLKSfNEPRGMS5@cluster0.rjo9xgd.mongodb.net/?retryWrites=true&w=majority";
var db;
MongoClient.connect(uri, function(err, client){
  // MongDB 연결후 할 일
  if(err) {return console.log(err);}
  db = client.db('toDoApp'); // 'toDoApp' 데이터 베이스 연결
  app.listen(8090, function(){
    console.log('listening on 8090');
  });
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
  // 1. counter 컬렉션에 현재시퀀스값(post_sq)을 가져옵니다.
  db.collection('counter').findOne({name : '현재시퀀스'}, function(err, result){
    if(err) {return console.log(err); }
    // console.log(result); findOne결과
    var post_sq = result.post_sq; // 현재시퀀스 값
    // 2. {_id:현재시퀀스+1, title:req.body.title, date:req.body.date}를 post에 insert
    db.collection('post').insertOne({_id:post_sq+1, 
                                    title:req.body.title,
                                    date : req.body.date}, function(err, result){
      if(err) {return console.log(err); }
      // 3. counter의 post_sq값을 1증가시킨다
          // updateOne({수정할조건}, {$set : {수정할내용}}, function(err, result){});
          // updateOne({수정할조건}, {$inc : {증분할내용}}, function(err, result){});
      db.collection('counter').updateOne({name:'현재시퀀스'}, 
                                         {$inc: {post_sq : 1}}, 
                                         function(err, result){
                                          if(err) {return console.log(err); }
                                          // 1~3까지 err없으면 write.html로 가기 
                                          console.log('post 등록 완료');
                                          res.sendFile(__dirname + "/write.html");
                                         });
    });
  });
});

// '/list' 요청(get)으로 들어오면 post find한 결과를 배열로 받아 브라우저 화면에 출력