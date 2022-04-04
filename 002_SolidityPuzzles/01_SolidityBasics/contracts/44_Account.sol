// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
    Note: we will be create/ create to - a contract from another copntract
 */
contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
}

contract AccountFactory {

    Account[] public accounts;

    // This function is going to deploy the Account Contract
    function createAccount(address _owner) external payable {
        Account account = new Account{value: 111}(_owner);
        accounts.push(account);
    }
}