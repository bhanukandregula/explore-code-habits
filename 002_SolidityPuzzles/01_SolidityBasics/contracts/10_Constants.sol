// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//21442 Gas for Constants contract
contract Constants {
    // If we knew some state variable will change, then its better practice to change it to contant
    // we can save Gas this way
    // address public myAddress = 0x4feB9F1cebD99A4eAA1843B93C254261e5560E81;
    address public constant my_address = 0x4feB9F1cebD99A4eAA1843B93C254261e5560E81;
    uint public constant my_uint = 123;
}

// This contract below will consume more Gas
// 23553 Gas for Var contract
contract Var {
    address public myAddress = 0x4feB9F1cebD99A4eAA1843B93C254261e5560E81;
}