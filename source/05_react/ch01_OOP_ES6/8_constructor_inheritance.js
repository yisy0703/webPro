// class 상속 추천
// class Person{
//   constructor(name, first, second){
//     this.name = name;
//     this.first = first;
//     this.second = second; 
//   }
//   sum(){
//     return this.first + this.second;
//   }
// }
// class PersonPlus extends Person{
//   constructor(name, first, second, third){
//     super(name, first, second);
//     this.third = third;
//   }
//   sum(){
//     return this.first + this.second + this.third;
//   }
//   avg(){
//     return this.sum()/2;
//   }
// }
// 생성자 함수를 통한 상속
function Person(name, first, second){
  this.name = name;
  this.first = first;
  this.second = second;
}
Person.prototype.sum = function(){
  return this.first + this.second;
};
function PersonPlus(name, first, second, third){
  Person.call(this, name, first, second); // this.name, this.first, this.second 초기화
  this.third = third;
}
// PersonPlus.prototype.__proto__ = Person.prototype;
PersonPlus.prototype = Object.create(Person.prototype);
PersonPlus.prototype.constructor = PersonPlus;
PersonPlus.prototype.sum = function(){
  return this.first + this.second + this.third;
};
PersonPlus.prototype.avg = function(){
  return this.sum()/3;
};
var son = new PersonPlus('손흥민', 100,100,100);
console.log('손 sum : ', son.sum());
console.log('손 avg : ', son.avg());