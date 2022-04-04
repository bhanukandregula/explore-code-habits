// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Payable - it adds functionality to send and receive Ether
contract Payable {
    // this address will now be able to send Ether.
    address payable public owner;
    
    constructor(){
        owner = payable(msg.sender);
    }
    
    function deposit() external payable {

    }

    function checkBalance() external view returns (uint) {
        return address(this).balance;
    }
}