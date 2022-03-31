// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DefaultSolidityValues {
    // state and local variable shas a default values if we don't assign them a value
    bool public b; // default value for boolean is false
    uint public u; // uint default is 0
    int public i; // int default value is  0
    address public a; // defalt value of address is: 0X0000000000000000000000000000000000
    bytes32 public b32; // 0X00000000000000000000000000000000 (64 0's)
}