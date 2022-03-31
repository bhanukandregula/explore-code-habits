// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Let's have a look at below list of concepts all together

// state variables
// global variables
// function modifier
// functions
// error handling

contract OwanableDemo {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }

    // Only the current owner will be able to set the new owner
    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }

    // function only owner can call
    function onlyOwnerCanCall() external onlyOwner {

    }
    
    // function anyone can all
    function anyOneCanCall() external {

    }
}