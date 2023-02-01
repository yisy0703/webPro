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
var kim = new Person('홍길동', 100, 90);
var son = new Person('손흥민');