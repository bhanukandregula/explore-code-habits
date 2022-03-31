// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// State variables are variablesthat stores _;
// the data on blockchain
contract StateVariables {

    // State variables declared inside the contract and outside the function
    // myUnit value is going to store on the blockchain
    uint256 public myUint = 123;

    function foo() external {
        uint256 notStateVariable = 456;
    }
}
