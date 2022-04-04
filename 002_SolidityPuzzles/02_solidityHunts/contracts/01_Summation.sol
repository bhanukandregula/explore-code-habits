// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Summation {
    
    function SummationNum(int n) public pure returns (int) {
        int sum = 0;
        for(int i=0; i<=n; i++){
            sum = sum + i;
        }
    return sum;
    }
}

//  sum = await Summation.deployed()
// 