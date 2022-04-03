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
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns( string memory) {
        return "B";
    }
}

contract C is B {
    function bar() public pure override returns( string memory) {
        return "C";
    }
}