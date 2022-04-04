// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Visibility
// private - only inside the contract
// internal - only inside contract and child contracts
// public - inside and outside contracts
// external - only from outisde contracts

// Demo as follows
// A - private, Internal, public and external
// B is A - internal, public
contract Visibility {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (uint) {
        return 0;
    }

    function internalFunc() internal pure returns (uint) {
        return 100;
    }

    function publicFunc() public pure returns (uint) {
        return 200;
    }

    function externnalFunc() external pure returns (uint) {
        return 300;
    }

    function examples() external view {
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();
        // externalFunc(); we can not call external functions
        // this.externnalFunc(); this will work, but its a Gas inefficient 
    }
}

contract VisibilityChild is Visibility {
    function example2() external view {
        y + z;
        internalFunc();
        publicFunc();
    }
}
