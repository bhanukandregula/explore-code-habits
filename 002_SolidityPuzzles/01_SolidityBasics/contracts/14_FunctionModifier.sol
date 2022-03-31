// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Function modifier - reuse code beforte and / or after function
// Basics, Inputs and Sandwich
contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused(){
        require(!paused, "paused");
        _;
    }

    function increment() external whenNotPaused {
        count += 1;
    }

    function decrement() external whenNotPaused {
        count -= 1;
    }
    /************************************************* */
    modifier cap(uint _x) {
        require( _x < 100, "x >= 100");
        _;
    }

    function incrementBy(uint _x) external cap(_x) {
        count += _x;
    }

    /*************************************************** */

    modifier sandwich(){
        // code here
        count += 10;
        _;
        // mode code here
        count *= 2;
    }

    function foo() external sandwich {
        count += 1;
    }

    /***************************************************** */
}