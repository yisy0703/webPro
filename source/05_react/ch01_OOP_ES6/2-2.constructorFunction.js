function Person(name, first, second){
  this.name = name;
  this.first = first;
  this.second = second;
}
Person.prototype.sum = function(){
  return this.first + this.second;
};
var kim = new Person('kim', 10, 20);
var lee = new Person('lee', 30, 40);
console.log(kim.name,',', kim.first, ',',kim.second, ',', kim.sum());
console.log(lee.name,',', lee.first, ',',lee.second, ',', lee.sum());