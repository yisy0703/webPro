// ES6에서는 class끼리 뿐 아니라 객체끼리도 상속관계를 맺을 수 있다.
var superObj = { superVal : 'super value'};
var subObj = {subVal : 'sup value'};

subObj.__proto__ = superObj; // 표준으로 인정받지는 못한 방법

console.log(subObj.superVal);
subObj.superVal = 'subObj에서 수정';
//debugger; // 일시중지하면서 객체 상태를 모니터링
console.log('수정 후 subObj.superVal :', subObj.superVal);
console.log('수정후 superObj.superVal : ', superObj.superVal);