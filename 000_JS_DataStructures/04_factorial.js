console.log("****************** Factorial of Number ******************");

//5! = 5 * 4* 3* 2* 1

function stack(){
    this.dataStore = [];
    this.top = 0;
    this.pop = pop;
    this.push = push;
    this.peek = peek;
    this.clear = clear;
    this.length = length;
}

function push(element){
    this.dataStore[this.top++] = element;
}

function pop(){
    return this.dataStore[--this.top]
}

function peek(element){
   return this.dataStore[this.top-1];
}

function clear(){
    this.top = 0;
}

function length(){
    return this.top;
}

// To create a facctorial of given number
function isFactorial(number_input){
    var s = new stack();
    while(number_input>1){
        s.push(number_input--);
    }

    var product = 1;
    while(s.length()>0){
        product *= s.pop();// product of 3 * 2 * 1
    }
    return product;
}
console.log("Factorial value is:", isFactorial(5));
