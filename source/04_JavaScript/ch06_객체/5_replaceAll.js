// var str = '안녕00방가00좋은아침00좋은하루'; // 00 -> x 교체
// console.log('원본 str : ' + str);
// var splitStr = str.split('00'); // ['안녕','방가','좋은아침','좋은하루']
// console.log('분할된 str : ' + splitStr);
// var joinStr = splitStr.join('x');
// console.log('join된 str : ' + joinStr);
function replaceAll(str, oldStr, newStr){
  let splitStr = str.split(oldStr);
  let result = splitStr.join(newStr);
  return result;
  // return str.split(oldStr).join(newStr);
}
// var replaceStr = replaceAll('바로 미인을 두손을 기관과', ' ' , '');
// console.log('결과 : ' + replaceStr);