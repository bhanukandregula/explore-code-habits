// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// fallback() or receive();

/****

    Ether is sent to contract
                |
                |
        is msg.data empty?
                |
                |
            /       \
           /         \
        yes             No
        |                  \
        |                    \
receive() exists?         fallback()
        /\
       /  \
      yes  no
      /     \
     /       \
receive()  fallback()
 
Bhanu ART :) :P

*/

// Fallback executed when:
    // - function doesn't exist
    // - directly send ETH

// main usecase of fallback function is to enable direct sending/ receiving of ETH
// If someone calls foo() function which doens't exist, then fallback function will invoke by default.
contract FallbackDemo {

    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}