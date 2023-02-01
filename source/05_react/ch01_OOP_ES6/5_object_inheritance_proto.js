// ES6에서는 class끼리 뿐 아니라 객체끼리도 상속관계를 맺을 수 있다.
var superObj = { superVal : 'super value'};
var subObj = {subVal : 'sup value'};
subObj.__proto__ = superObj;
console.log(subObj.superVal);
subObj.superVal = 'subObj에서 수정';
console.log('수정 후 subObj.superVal :', subObj.superVal);
console.log('수정후 superObj.superVal : ', superObj.superVal);
