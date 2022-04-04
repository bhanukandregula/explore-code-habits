// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HashFunction {
    
    function hash(string memory text, uint num, address addr) external pure returns (bytes32) {
        // abi.encode(arg); // this returns bytes
        // abi.encodePacked(arg); this returns bytes but compresses it. Output will be smaller when compared to abi.encode(arg);
        return keccak256(abi.encodePacked(text, num, addr));
    }

    function encode(string memory text0, string memory text1) external pure returns (bytes32) {
        return abi.encode(text0, text1);
    }

    function encodePacked(string memory text0, string memory text1) external pure returns (bytes32) {
        return abi.encodePacked(text0, text1);
    }

    // function collision(string memory text0, string memory text1) external pure returns (bytes32) {
    //     return keccak256(abi.encodePacked(text0, text1));
    // }

    function collision(string memory text0, uint x, string memory text1) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, x, text1));
    }

}