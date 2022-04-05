// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
    - Anyone should be able to deposit ETH in this contract, 
    - however, only the owner will able to withdraw the ETH from Piggy bank
 */
contract PiggyBank {

    /**
        - Add an event when someone deposits ETH to this contract
     */
    event Deposit(uint amount);
    event Withdraw(uint amount);

    address public owner = msg.sender;

    // This will receive ETH to this contract
    // we can invoke this by clicking on the TRANSACT on deploy section in Remix
    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "not owner");
        /**
            - We have to send all the ETH available in this contract to owner
            - We have to delete this contract
         */
         /**
            - Emit an event when owner withdraws the ETH from this contract
          */
        emit Withdraw(address(this).balance);
        selfdestruct(
            payable(msg.sender) // sending ETH to owner
        );
    }
}