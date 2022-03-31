// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract LocalVariable {
    uint256 public i;
    bool public b;
    address public myAddress;

    // After the function executes, l;ocal variables inside the function _;
    // are gone.
    function foo() external {
        uint256 x = 123;
        bool f = false;

        x += 456;
        f = true;

        i = 123; // state variable
        b = true;// local variable
        myAddress = address(1);
    }
}
