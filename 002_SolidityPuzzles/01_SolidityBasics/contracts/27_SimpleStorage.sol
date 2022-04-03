// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    // state variable - text
    string public text;

    // calldata saves Gas than using memory
    // gas consumed when we used memory - 349348
    // gas consumed when we used calldata - 302655
    function setText(string calldata _text) external {
        text = _text;
    }


    // since its delcared as public, getter will be there by fault
    function getText() external view returns(string memory) {
        return text;
    }
}