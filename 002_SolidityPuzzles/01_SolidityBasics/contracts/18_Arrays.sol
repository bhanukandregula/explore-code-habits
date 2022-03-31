// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Array - dynamic to Fixed size
// Arrays initialization
// Insert (push), get, update, delete, pop, length
// Creating array in memory
// Returning array from function

contract ArraysDemo {
    // Dynamic array
    uint[] public nums = [1,2,3];

    // Fixed size array
    uint[3] public numsFixed = [4,5,6];

    function examples() external {
        // we can't push elements to fized size array
        // push adds element at the end of array - dynamic array
        nums.push(4); // [1,2,3,4]

        uint x = nums[1]; // we can access array element with index value

        nums[2] = 777; // [1,2,777,4] updating the index value

        // even we delete an element in array, lenght of the array remains same
        delete nums[1]; // This will delete element at index 1 [1,0,777,4]

        // pop will remove last element in array
        // length of the array will be decreased unlike delete
        nums.pop();

        // lenght of the array
        uint len = nums.length;

        // creating an array in memory
        // no push() and pop() in the array created in memory
        // update (or) get the value will work in memory array 
        uint[] memory a = new uint[](5);
        a[1] = 123;

    }

    // This function returns an array
    function myArray() public view returns (uint[] memory){
        return nums;
    }

}