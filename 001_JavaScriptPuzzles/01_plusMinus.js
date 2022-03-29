var sampleArray = [-2,-3,-8,0,1,2,3];
var positiveCount = 0;
var negativeCount = 0;
var zeroCount = 0;
var totalArrayCount = sampleArray.length;
for(var i=0; i<sampleArray.length; i++){
    if(sampleArray[i] > 0){
        positiveCount++;
    }else if(sampleArray[i] < 0){
        negativeCount++;
    }
    else{
        zeroCount++;
    }
}

console.log("Positive numbers ratio: ", positiveCount/totalArrayCount);
console.log("Negative numbers ratio: ", negativeCount/totalArrayCount);
console.log("Zero numbers ratio: ", zeroCount/totalArrayCount);

// Hacker Ran code snippet.
'use strict';

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', function(inputStdin) {
    inputString += inputStdin;
});

process.stdin.on('end', function() {
    inputString = inputString.split('\n');
    main();
});

function readLine() {
    return inputString[currentLine++];
}

/*
 * Complete the 'plusMinus' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

// function plusMinus(arr) {
//     var postiveCount = 0;
//     var negativeCount = 0;
//     var zeroCount = 0;
    
//     for(var i=0; i<arr.length; i++){
//         if(arr[i] > 0){
//             postiveCount++;
//         }else if(arr[i] < 0){
//             negativeCount++;
//         }else{
//             zeroCount++;
//         }
//     }
    
//     console.log((postiveCount/arr.length).toFixed(6));
//     console.log((negativeCount/arr.length).toFixed(6));
//     console.log((zeroCount/arr.length).toFixed(6));
// }

// function main() {
//     const n = parseInt(readLine().trim(), 10);
//     const arr = readLine().replace(/\s+$/g, '').split(' ').map(arrTemp => parseInt(arrTemp, 10));
//     plusMinus(arr);
   
// }


