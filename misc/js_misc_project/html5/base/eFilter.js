// filter,map,some,lastIndexOf(), indexOf():等函数demos
var ages = [32, 33, 16, 40];

function checkAdult(age) {
    return age >= 18;
}

function myFunction() {
    document.getElementById("demo").innerHTML = ages.filter(checkAdult);
}

// forEach()会改变原始的数组的值，而map()会返回一个全新的数组
//  将所有的数组元素转换为大写：
var strings = ["hello", "Array", "WORLD"];
function makeUpperCase(v)
{
    return v.toUpperCase();
}
var uppers = strings.map(makeUpperCase);

//
//检查是否有数组元素大于等于10：

function isBigEnough(element, index, array) {
    return (element >= 10);
}
var passed = [2, 5, 8, 1, 4].some(isBigEnough);
// passed is false
passed = [12, 5, 8, 1, 4].some(isBigEnough);
// passed is true
//结果：
//[2, 5, 8, 1, 4].some(isBigEnough) ： false 
//[12, 5, 8, 1, 4].some(isBigEnough) ： true 


//测试是否所有数组元素都大于等于10：

function isBigEnough(element, index, array) {
    return (element >= 10);
}
var passed = [12, 5, 8, 130, 44].every(isBigEnough);
// passed is false
passed = [12, 54, 18, 130, 44].every(isBigEnough);
// passed is true
//结果：
//[12, 5, 8, 130, 44].every(isBigEnough) 返回 ： false 
//[12, 54, 18, 130, 44].every(isBigEnough) 返回 ： true 

//打印数组内容：

function printElt(element, index, array) {
    document.writeln("[" + index + "] is " + element + "<br />");
}
[2, 5, 9].forEach(printElt);
// Prints:
// [0] is 2
// [1] is 5
// [2] is 9
//结果：
//[0] is 2
//[1] is 5
//[2] is 9