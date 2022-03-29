console.log("****************** Palindrome Example Code ******************");

// LIFO - Last In First Out
// madam - madam when we reverse the characters from left to right/ right to left
// racecar - also a palindrome
// constructor
function stack(){
    this.dataStore = [];
    this.top = 0;
    this.push = push;
    this.peek = peek;
    this.pop = pop;
    this.clear = clear;
    this.length = length;
}

// This add element to the stack
function push(element){
    this.dataStore[this.top++] = element;
}

function peek(element){
    return this.peek[this.top-1];
}

function pop(){
    return this.dataStore[--this.pop];
}

function clear(){
    this.top = 0;
}

function length(){
    return this.top;
}

// This will verify if the given word is palindrome or not
// Impementation of Palindrome check with stack - data structure
function isPalindrome(word){
    var s = new stack();
    for(var i=0; i<word.length; ++i){
        s.push(word[i]); // This will push all the letters in word to the stack
    }

    var r_word="";
    while(s.length>0){
        r_word += s.pop();
    }

    if(word==r_word){
        return true;
    }else{
        return false;
    }
    
}


var word = "hello";
if(isPalindrome(word)){
    console.log("This is a Palindrome");
}else{
    console.log("This is not a Palindrome");
}

var word = "madam";
if(isPalindrome(word)){
    console.log("This is a Palindrome");
}else{
    console.log("This is not a Palindrome");
}


var word = "racecar";
if(isPalindrome(word)){
    console.log("This is a Palindrome");
}else{
    console.log("This is not a Palindrome");
}