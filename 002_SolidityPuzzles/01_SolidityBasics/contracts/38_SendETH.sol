// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
    - There are three ways tos end Ether from contract
    - 01. Transfer;
    - 02. Send; 2300 Gas, returns bool
    - 03. Call; all Gas, returns bool and data
 */
contract SendEther {
    // 01. Inorder to send Ether, this contract must be able to receive Ether
    // Payable 
    constructor() payable {

    }
    // fallback() external payable {} (or)
    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        // 123 is the amount to ether to send
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    // This is very expensive call and this consumes a lots of Gas than compare to send() and transfer()
    function sendViaCall(address payable _to) external payable {
        // (bool success, bytes memory data) = _to.call{value: 123}("");
        (bool success, ) = _to.call{value: 123}("");
        require(success, "call failed");
    }
}


// Note: we are sending ETH from "SendEther" contract to "EthReceiver" contract.
contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}