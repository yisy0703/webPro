let kim = {
  name : 'kim',
  first : 10,
  second : 20,
  sum : function(){
    return this.first + this.second;
  },
};
let lee = {
  name : 'lee',
  first : 30,
  second :20,
  sum : function(){
    return this.first + this.second;
  },
};
console.log(kim.name,',', kim.first, ',',kim.second, ',', kim.sum());
console.log(lee.name,',', lee.first, ',',lee.second, ',', lee.sum());