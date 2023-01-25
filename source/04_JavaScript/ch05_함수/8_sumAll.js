// JavaScript source code(8_sumAll.js)
function sumAll(){
  var result=0;
  if(arguments.length==0){
    result = -999;
  }else{
    for(var idx in arguments){
      result += arguments[idx];
    }
  }
  return result;
}
console.log(sumAll());
console.log(sumAll(3));
console.log(sumAll(1,2,3,4));
console.log(sumAll(1,2,3,10,100));