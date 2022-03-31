pragma solidity ^0.8.7;

contract FunctionsIntro {

    // function which sums tow values and return an integer
    // External - which means this function is visible to the world
    // Pure - this means this function is only to read data, _;
    // not writing any data to blockchain
    function addition(uint a, uint b) external pure returns(uint) {
        return a + b;
    }

    // substract two numbers
    function sub(uint a, uint b) external pure returns(uint) {
        if(a > b){
            return a - b;
        }else{
            return b - a;
        }
    }
}

// truffle console
// functionsDemo = await FunctionsIntro.deployed()
// fucntionsDemo.addition(23,23)