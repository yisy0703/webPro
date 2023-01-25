// cf. 가변인자함수 : 매개변수의 갯수에 따라 변하는 함수. 화살표 함수에서는 불가
// 내장 함수 : Array()를 이용해서 가변인자 함수 array()를 생성
var arr1 = [273, 2, 3, 'Hello', ];
var arr2 = Array(273, 2, 3, 'Hello');
var arr3 = [ , , , ]; // 방3개짜리 빈 배열
var arr4 = Array(3);  // 방3개짜리 빈 배열
var arr5 = []; // 방의 갯수가 0인 배열
var arr6 = Array(); //방의 갯수가 0인 배열

console.log('arr1=', arr1, ' - 방의 갯수=', arr1.length);
console.log('arr2=', arr2, ' - 방의 갯수=', arr2.length);
console.log('arr3=', arr3, ' - 방의 갯수=', arr3.length);
console.log('arr4=', arr4, ' - 방의 갯수=', arr4.length);
console.log('arr5=', arr5, ' - 방의 갯수=', arr5.length);
console.log('arr6=', arr6, ' - 방의 갯수=', arr6.length);