// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewAndPureFunctions {

    // View functions can read data from thr Blockchain
    // Pure functions don not read anything form the Blockchain

    // state variables
    uint public number;

    // since this function can read state variable, view keywprd is applicable
    // state variable are the values which stores on the blockchain
    function viewFunc() external view returns (uint){
        return number;
    }

    function pureFunc() external pure returns (uint) {
        return 1;
    }

    // keyword check - view
    function addToNumber(uint x) external view returns (uint){
        return number + x;
    }

    // keyword check - pure 
    function add(uint x, uint y) external pure returns (uint){
        return x + y;
    }
}