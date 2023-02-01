var hong = {name:'hong', first:10, second:20};
var shin = {name:'shin', first:20, second:40};

first = 100;
second = 90;
function sum(prefix=' : '){
  return prefix + (this.first + this.second);
}
console.log('외부 변수의 합', sum()); // sum 내부의 this : window객체
console.log('외부 변수의 합', sum(' = '));
console.log('hong의 합', sum.call(hong)); // sum 내부의 this : hong
console.log('hong의 합', sum.call(hong, ' = '));// hong은 this, '='은 prefix
console.log('shin의 합', sum.call(shin, ' - ')); 

var hongSum_ = sum.bind(hong);
console.log('bind를 이용한 hong의 합', hongSum_());

var hongSum = function (prefix=' : '){
  return prefix + (this.first + this.second);
}.bind(hong);
console.log('bind를 이용한 hongSum',hongSum());
var shinSum = sum.bind(shin, '='); // this에는 shin, prefix에 '='
console.log('bind를 이용한 shinSum', shinSum());