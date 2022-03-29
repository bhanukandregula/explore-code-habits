var numberArray = [1,2,3,4,5];
var sum = 0;
var sumArray = [];
var traverse_numberArray = [];

for(var i=0; i<numberArray.length;i++){
    traverse_numberArray = numberArray.slice(0,i).concat(numberArray.slice(i+1, numberArray.length));
    for(var j=0; j<traverse_numberArray.length; j++){
        sum = sum + traverse_numberArray[j];
    }
    sumArray.push(sum);
    sum = 0;
}
console.log(Math.min.apply(Math, sumArray) + " " + Math.max.apply(Math, sumArray));

// Code submitted in Hacker rank

// 'use strict';

// process.stdin.resume();
// process.stdin.setEncoding('utf-8');

// let inputString = '';
// let currentLine = 0;

// process.stdin.on('data', function(inputStdin) {
//     inputString += inputStdin;
// });

// process.stdin.on('end', function() {
//     inputString = inputString.split('\n');

//     main();
// });

// function readLine() {
//     return inputString[currentLine++];
// }

// /*
//  * Complete the 'miniMaxSum' function below.
//  *
//  * The function accepts INTEGER_ARRAY arr as parameter.
//  */

// function miniMaxSum(arr) {
//     // Write your code here
//     var sum = 0;
//     var sumArray = [];
//     var traverse_arr= [];

//     for(var i=0; i<arr.length;i++){
//         traverse_arr= arr.slice(0,i).concat(arr.slice(i+1, arr.length));
//         for(var j=0; j<traverse_arr.length; j++){
//             sum = sum + traverse_arr[j];
//         }
//         sumArray.push(sum);
//         sum = 0;
//     }
//     console.log(Math.min.apply(Math, sumArray) + " " + Math.max.apply(Math, sumArray));
// }

// function main() {

//     const arr = readLine().replace(/\s+$/g, '').split(' ').map(arrTemp => parseInt(arrTemp, 10));

//     miniMaxSum(arr);
// }
