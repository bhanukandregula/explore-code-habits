// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Mapping syntax
// How to declare a mapping - simple and nested
// Set, Get and Delete

// [ 'Bhanu', 'Raghu', 'Shyam']
// { "Bhanu" : true, "Raghu": true, "Shyam": true }

// In order to find an element in an array, we have to traverse loop upto lenght of the array
// But if we use mappingw, we can to right at first shot to find out searching element
contract MappingDemo {
    // mapping(key => value)
    mapping(address => uint) public balances;
    mapping(address=> mapping(address => bool)) public isFriend;

    function example() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)]; // 0

        balances[msg.sender] += 456; // 123 + 456 = 579
        delete balances[msg.sender]; // 0

        isFriend[msg.sender][address(this)] = true;

    }
}