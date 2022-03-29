// declaration of arrays
var numbersInWords = ['one', 'two', 'three', 'four', 'five', 'six'];
var numbers = [1,2,3,4,5];


var friends = new Array(20);

console.log("Length of numberToWords array: ",numbersInWords.length);
console.log("Length of numbers array: ", numbers.length);
console.log("Length of Friends array: ", friends.length);

// writing elements into an array
var nums = [];
for(var i=0; i<100; i++){
    nums[i] = i+1;
}
console.log(nums);

// split functionality
var sentence = "India is my country";
var words = sentence.split(" ");
for(var i=0; i<words.length; i++){
    console.log(words[i]);
}

// Join and toString demo code
var names = ['Bhanu', 'Raghu', 'Shyam', 'Divya'];
console.log("Lenght of names array", names.length);
console.log("Names Array: ",names);
console.log("Joined Names Array:", names.join());
console.log("Names toString value:", names.toString());

// concat() function to join multiple arrays
var zero = 0;
var positiveNumbers = [1,2,3,4,5];
var negativeNumbers = [-5, -4, -3, -2, -1];
var numberSet = negativeNumbers.concat(zero, positiveNumbers);
console.log('Complete numberSet:', numberSet);

// Number even/odd check
var isEven = (numberCheck) => {
    var result = (numberCheck%2 == 0) ? "Even Number" : "Odd Number";

    // if(numberCheck%2 == 0){
    //     console.log("Even Number");
    // }else{
    //     console.log("Odd Number");
    //}
    console.log("Number is:", result);
}
// isEven(222);

var numbersToCheckEvenOdd = [99,345,765,-34,1,2,3,4,5,6,7,89];
// every functyion is JS will execute in all the elements in an array
numbersToCheckEvenOdd.every(isEven);

// returns the boolean value in forEach loop
numbersToCheckEvenOdd.forEach((x) => {
    console.log(x%2 == 0);
});

// sorting of elements
console.log("Sorting of elements in array:", numbersToCheckEvenOdd.sort());

// compare in arrays
function compare(a, b) {
    if(a>b){
        return 1;
    }else if(a<b){
        return -1;
    }
    return 0;
}

console.log(numbersToCheckEvenOdd.sort(compare))
// console.log(compare(23,435));
console.log("************ Milti Dimensional Aray Declatarion ***************");
// Multi Dimensional Arrays
// Array of Array's are multi dimensional arrays
var twod = []; // Declaration of empty array
var rows = 5;
for(var i=0; i<rows; i++){
    twod[i] = [];
}
console.log('TwoD: ', twod);


console.log("************ MDA - Student Grades Systems ***************"); 

var grades  = [ [89,77,78], [76,82,81], [91,94,97] ];
var total = 0;
var average = 0.0;
for(var row=0; row<grades.length; ++row){
    for(var col=0; col<grades[row].length; ++col){
        //  console.log("Each element in the Matrix: ", grades[row][col]);
        total = total + grades[row][col];
    }
    // Average calculation
    console.log("This is total value: ", total);
    average = total/grades[row].length;
    console.log("Student: "+parseInt(row+1)+"Average is: "+ average.toFixed(2));
}


console.log("************ Lists ***************");

// Creation of lists
function List(){
    this.listSize = 0;
    this.position = 0;
    this.dataStore = []; // Initializes array in store list elements
    this.toString = toString;
    this.append = append;
    this.remove = remove;
    this.length = length;
}

// Length of the List
function length(){
    return this.listSize;
}

// Appending the list
function append(element){
    this.dataStore[this.listSize++] = element;
}

function toString(){
    return this.dataStore;
}

function remove(){
    delete this.dataStore;
    this.dataStore = [];
    this.listSize = 0;
}

var names = new List();
names.append('Name01');
names.append('Name02');
names.append('Name03');
console.log("Names are: ", names);
console.log("Names as strings: ", names.toString());
console.log("Length of the gives names: ", names.length());
names.remove();
console.log("Names are: ", names.length());

console.log("************** Stacks & Queues ***************");


// Initializing the stack
function stack(){
    this.dataStore = [];
    this.top = 0;
    this.push = push; // Inserting the elements to stack
    this.pop = pop; // Removing the the element in stack
    this.peek = peek; // Top values on the stack is called peek 
    this.clear = clear;
    this.length = length;
}

// Adding an elemnt in stack to top most position
function push(element){
    this.dataStore[this.top++] = element;
}

// Next elemnt after the top most element - (n-1)
function peek(){
    return this.dataStore[this.top - 1];
}

// removing element from the given stack
function pop(){
    return this.dataStore[-this.top];
}

// All the elements in the stack will clear
function clear(){
    this.top = 0;
}

function length(){
    return this.top;
}

var s = new stack();
s.push("Bhanu");
s.push("Prakash");
s.push("Satya");
s.push("Srinu");
s.push("Vasu");
s.push("Shankar");
s.push("Ganesh");
s.push("Hola");
console.log("Stack includes: ", s);

console.log("Peek element: ", s.peek());
console.log("Length of the Stack: ", + s.length());

var poppedElement = s.pop();
console.log("The popped element is: ", poppedElement);

console.log("Peek Element again: ",s.peek());
s.push("Bhanu Prakash Kandregula");
s.clear();
console.log("Length of the Stack: ", + s.length());



























