// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Events allow us to write data on the blockchain
contract Event {
    // 01.create an event
    event Log(string message, uint value);

    // upto 3 params can be indexed, not more than three
    event IndexedLog(address indexed sender, uint val);

    // this is a transactional function, since there is no pure or view
    // If we execute this function, this will store data on the blockchain
    function example() external {
        // 02. Emit an event
        emit Log("foo", 1234);
        emit IndexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string messsage);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}