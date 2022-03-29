// different types of declarations
var number = 534;
var name = 'Bhanu Kandregula';
var booleanValue = true;
var rateOfInterest = 1.45;


// Math functions
var a = 9; 
console.log(Math.sqrt(a));

var lowValue = 01;
var midValue = 25;
var highValue = 100;
var currentValue = 20;

// decision - conditional statements
if(currentValue < midValue){
    currentValue = midValue;
}
console.log('This is the lowest current Value: ', currentValue);

// while loop code
var sum = 0;
var number = 01;
while(number < 11){
    sum = sum + number;
    ++number;
}
console.log('This is Sum value: ', sum);

// for loop code
var totalValue = 0;
for(var i=1; i<11; i++){
    totalValue = totalValue + i;
}
console.log('Total Value:', totalValue);

// function code
// checking factorial of giver numeric input to function
var productValue = 1;
function factorial(numberValue){
    for(var i=numberValue; i>=1; --i){
        productValue = productValue * i;
    }
    console.log('This is productValue: ', productValue);
}
factorial(4); // invoking the function





