// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Data locations - Storage, Memory and callData
// storage - data is a state variable
// Memory - Data is stored in momory locations
// callData - except they can only be used in function inputs
contract StorageMemoryCalldata {

    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    // Note: Use storage to update data
    // Note: Use memory to read the data
    function example02(uint[] calldata y, string calldata s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({ foo: 123, text: "bar"});
        // we will use storage when we wnants toi modify the struct
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        // we can alos modify the data in memory, but since it's memory 
        // once function execution is done, data is gone from memory
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        _internal(y);

        // Note: we can only create fixed size array, we can not create dynamic array
        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;

    }

    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }

    // Note: Use storage to update data
    // Note: Use memory to read the data
    function example01(uint[] memory y, string memory s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({ foo: 123, text: "bar"});
        // we will use storage when we wnants toi modify the struct
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        // we can alos modify the data in memory, but since it's memory 
        // once function execution is done, data is gone from memory
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        // Note: we can only create fixed size array, we can not create dynamic array
        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;

    }
}