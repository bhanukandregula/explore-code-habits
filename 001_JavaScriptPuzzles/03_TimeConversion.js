function timeConversion12to24(s){
    var timeline = s.slice(-2);
    var newHour = 00;

    const [hour, minutes, seconds] = s.split(":");
    const newSeconds = seconds.slice(0,2);

    if(timeline=="AM" && hour == 12){
        newHour = "00";
    }else if(timeline=="PM" && hour==12){
        newHour = 12;
    }else if((hour > 0 && hour<=11) && timeline=="AM"){
        newHour = parseFloat(hour);
        newHour = newHour.toString().padStart(2, '0');

    }else if((hour > 0 && hour<=11) && timeline=="PM"){
        newHour = parseFloat(hour) + 12;
    }

    var newTime = [newHour, minutes, newSeconds];
    console.log(newTime.join(":"));
}

var inputTime = "06:40:03AM";
timeConversion12to24(inputTime);

// Code submitted in Hacker rank
// 'use strict';

// const fs = require('fs');

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
//  * Complete the 'timeConversion' function below.
//  *
//  * The function is expected to return a STRING.
//  * The function accepts STRING s as parameter.
//  */

// function timeConversion(s) {
//     // Write your code here
//     var timeline = s.slice(-2);
//     var newHour = 0;
//     ``
//     const [hour, minutes, seconds] = s.split(":");
//     const newSeconds = seconds.slice(0,2);

//     if(timeline=="AM" && hour == 12){
//         newHour = "00";
//     }else if(timeline=="PM" && hour==12){
//         newHour = 12;
//     }else if(hour > 0 && hour<=11 && timeline=="PM"){
//         newHour = parseFloat(hour);
//         newHour = newHour.toString().padStart(2, '0');
//     }else{
//         newHour = parseInt(hour);
//     }
//     var newTime = [newHour, minutes, newSeconds];
//     return(newTime.join(":"));
// }

// function main() {
//     const ws = fs.createWriteStream(process.env.OUTPUT_PATH);
//     const s = readLine();
//     const result = timeConversion(s);
//     ws.write(result + '\n');
//     ws.end();
// }
