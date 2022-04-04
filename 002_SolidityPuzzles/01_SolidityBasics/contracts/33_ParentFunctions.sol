// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// thre are two ways to call parent functions
    // 01. direct
    // 02. super 
contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {

    function foo() public virtual override {
        emit Log("F.foo");
        E.foo(); // This will invoke function foo() from contract E, direct way
    }

    function bar() public virtual override {
        emit Log("F.bar");
        super.bar(); // This will invoke bar() function from E contract, super keyword way
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }

}

contract H is F, G {
    function foo() public override(F, G) {
        F.foo();
    }

    function bar() public override(F, G) {
        super.bar();
    }
}
