/*
class Person {
  private String name ;
  private int age;
  Person(String name, int age){
    this.name = name; this.age=age;
  }
}
Person person = new Person("홍길동", 20);
*/
const i = 10;
// i = 11; 불가
const person = {'name':'홍길동','age':20,};
person.name = "신길동";

const arr = ['홍길동', 20];
//const arr = {0:'홍길동', 1:20};
console.log('arr[0] = ', arr[0], ' / arr[1] = ', arr[1]);
console.log('person[\'name\']=',person['name'], " / person['age']=", person['age']);
console.log('person.name=',person.name, " / person.age=", person.age);