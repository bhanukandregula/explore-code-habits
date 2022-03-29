// Base Conversions

function stack(){
    this.dataStore = [];
    this.top = 0;
    this.push = push;
    this.peek = peek;
    this.pop = pop;
    this.clear = clear;
    this.length = length;
}

function push(element){
    this.dataStore[this.top++] = element;
}

function pop(){
    return this.dataStore[--this.top];
}

function peek(element){
    return this.dataStore[this.top - 1];
}

function clear(){
    this.top = 0;
}

function length(){
    return this.top;
}

// function to convert numbers to base8/ vice versa
function multipleBase(number, base){
    var s = new stack();
    do{
        s.push(number % base);
        number = Math.floor(number /= base);
    }while(number > 0);

    var converted = "";
    // atleast one element 
    while(s.length() > 0){
        converted += s.pop();
    }
    return converted;
}

var number = 32;
var base = 2;

var newnumber = multipleBase(number, base);
console.log("This is new number: ", newnumber);


var number = 125;
var base = 8;

var newnumber = multipleBase(number, base);
console.log("This is new number: ", newnumber);