let sum = 0;
for(const i=1 ; i<=10 ; i++){ 
  sum += i;
  console.log("i = " + i +"일 때까지 누적된 합은 "+sum);
}
console.log("for문 끝");
console.log("for문 후 i값은 " + i);