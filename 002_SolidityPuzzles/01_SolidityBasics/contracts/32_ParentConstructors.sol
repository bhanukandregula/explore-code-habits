// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// we have 2 ways to call parent constructors
// order of initialization

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// // This is one way we initialize the constructor only when we knew the input types
// contract U is S("s"), T("t") {

// }

// This is one way we initialize the constructor only when we knew the input types
contract U is S("s"), T("t") {
    
}
/******************************************* */


// this is another of initializing the parent constructors in inheritance
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

/********************************************* */
 
// there is another way which could be the combination of both above ways
// S - static input here
// T - dynamic input example
contract VV is S("s"), T {
    constructor(string memory _text) T(_text) {

    }
}

/************************************************ */
// order of inheritance - S first and T second here || it could be vice versa
contract V0 is S, T { // this is the rule of thumb
    // 01 - S
    // 02 - T
    // 03 - V0
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

contract V1 is T, S { // this is the rule of thumb
    // 01 - S
    // 02 - T
    // 03 - V1
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}