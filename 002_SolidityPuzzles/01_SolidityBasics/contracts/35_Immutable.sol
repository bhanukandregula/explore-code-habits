// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Immutable - once contract is deployed, value will never change
// declaring the state variables as immutables, it will save some Gas
// Immutable variables can only be initialized when the contact is deployed
contract Immutable {
    // Note: address public owner = msg.sender; // Gas: 45718
    // address public immutable owner = msg.sender; // Gas: 43585 
    address public immutable owner;

    constructor(){
        owner = msg.sender;
    }

    uint public x;
    function foo() external {
        require(msg.sender == owner);
        x += 1;
    }
}