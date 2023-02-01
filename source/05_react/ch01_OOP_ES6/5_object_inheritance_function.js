var hong = {name:'홍길동'}; 
// var son = {age : 32};
// son.__proto__ = hong;
var son = Object.create(hong); // hong을 부모하는 새로운 객체를 생성 son.__proto__.name
son.age = 32;
console.log('hong.name :', hong.name);
console.log('son.name :', son.name);
console.log('son.age :', son.age);

son.name = '손흥민';
// debugger;
console.log('hong.name :', hong.name);
console.log('son.name :', son.name);
console.log('son.age :', son.age);