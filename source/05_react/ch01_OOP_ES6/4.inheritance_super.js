class Person{
  constructor(name, first, second){ // 생성자 이름은 무조건 constructor
    this.name = name;
    this.first = first;
    this.second = second;
  }
  sum(){
    return this.first + this.second;
  }
} // class
var hong = new Person('홍길동', 100, 60);
console.log('홍길동의 sum : ', hong.sum());
