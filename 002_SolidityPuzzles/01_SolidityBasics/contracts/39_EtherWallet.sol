// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
    Usecase:
        - Anyone can send ether to this contract and this contract will receive ether.
        - But only the owner of this contract can send Ether from this contract
 */
contract EtherWallet {
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }

    // This will allow contract to receive Ether
    // 01 - someone will send ETH to this contract
    receive() external payable {

    }

    // 02 - this contract will take the received ETH to its wallet
    // function to send ether out from this contract
    function withdraw(uint _amount) external {
        // only owner should execute this function
        require(msg.sender == owner, "caller is not owner");
        // transfer the ETH from this contract to the owner
        payable(msg.sender).transfer(_amount);
    }

    // 03 - we are fetching the balance of this contract here
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}