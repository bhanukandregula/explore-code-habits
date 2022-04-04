// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Note: Libraries allow us to re-use the functionality
// Note: We can not declare the state variables inside library
library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return (x >= y) ? x : y;
    }
}

contract LibraryDemo {

    // find the max
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

/******************************************************************** */

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for(uint i=0; i<arr.length; i++){
            if(arr[i] == x){
                return i;
            }
        }
        revert("Not found");
    }
}
contract TestArray {
    using ArrayLib for uint[];

    // state variables
    uint[] public arr = [3, 2, 1];

    function testFind() external view returns (uint i) {
        // return ArrayLib.find(arr, 2);
        return arr.find(2);
    }   
}