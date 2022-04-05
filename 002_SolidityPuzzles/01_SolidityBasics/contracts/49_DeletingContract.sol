// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// These are the ways we can self diuctruct the contracts
    // - delete contract
    // - force send Ether to any address
contract DeleteContract {

    constructor() payable {

    }

    function kill() external {
        // force sending ether to another contract
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns(uint) {
        return 123;
    }

}

contract Helper {
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function kill( DeleteContract _kill) external {
        _kill.kill();
    }
}