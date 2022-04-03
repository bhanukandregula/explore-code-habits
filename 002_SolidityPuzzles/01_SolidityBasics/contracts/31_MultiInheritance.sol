// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract A {
    // keyword "virtual" will tell solidity, this function can be inherited and customized 
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns( string memory) {
        return "A";
    }

    function baz() public pure returns (string memory) {
        return "A";
    }
}

contract B is A {
    // override is the implementation of virtual functions in inheritance
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns( string memory) {
        return "B";
    }

    function testB() public pure returns (string memory) {
        return "B";
    }
}

// This is multi inheritance, since foo() and bar() are being overridden in contracts A and C
contract C is A, B  {
    function foo() public pure override(A, B) returns( string memory) {
        return "C";
    }

     function bar() public pure override(A, B) returns( string memory) {
        return "B";
    }
}