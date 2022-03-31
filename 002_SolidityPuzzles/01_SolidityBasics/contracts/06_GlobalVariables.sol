// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// GV stores info sucah as Blockchain, transaction etc
contract GlobalVariables {
    function globalVars() external view returns (address, uint, uint) {
        // current account owner address
        address sender = msg.sender;

        // time of when this function was invoked
        uint timestamp = block.timestamp;

        // Current Block Number
        uint blockNumber = block.number;

        return(sender, timestamp, blockNumber);
    }
}

// globalVariable = await GlobalVariables.deployed()
// globalVariable.globalVars()