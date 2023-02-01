// class ECMA script 6이상을 지원하는 브라우저만 가능
// https://caniuse.com 를 이용하여 지원 브라우저 확인
class Person{
  constructor(name, first, second){ // 생성자 이름은 무조건 constructor
    console.log('생성자 함수 호출');
    this.name = name;
    this.first = first;
    this.second = second;
  }
  sum(){
    return this.first + this.second;
  }
} // class
var kim = new Person('kim', 10, 20);
kim.sum = function(){
  return '수정된 kim만의 sum : ' + (this.first+this.second);
};
var lee = new Person('lee', 30, 40);
console.log(kim.name,',', kim.first, ',',kim.second, ',', kim.sum());
console.log(lee.name,',', lee.first, ',',lee.second, ',', lee.sum());