// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// require, revert, assert
// -gas refund, state updates are reverted
// cusrom error - save gas
contract ErrorHandling {

    function testRequire(uint _i) public pure {
        require(_i <= 10, "i > 10"); // The longer the error message, more gas is consumed
        // code goes here
    }

    function testRevert(uint _i) public pure {
        if(_i > 10){
            revert("i > 10");
        }
    }

    uint public number = 123;
    function testAssert() public view {
        assert(number == 123);
    }

    error MyError(address caller, uint i);

    function testCustomeError(uint _i) public view {
        // require(_i <= 10, "very very very lomg error message, incase");
        if(_i > 10){
            revert MyError(msg.sender, _i);
        }
    }

}