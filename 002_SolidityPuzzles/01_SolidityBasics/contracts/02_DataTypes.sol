pragma solidity ^0.8.7;

contract ExploreDataTypes {

    // boolean is used for True (or) False
    bool public isValid = true;
    
    // No negetive for uint values, always >= 0
    // uint => uint256 is from 0 to 2**256 -1
    // uint8 is from 0 to 2**8 -1
    // uint16 is from 0 tp 2**16 -1
    uint public age = 23;

    // In order to use both negetive and postive numbers
    // int256 is from -2**255 to 2**255 -1
    // int128 is from -2**127 to 2**127 -1
    int public i = -123;

    // In order to find the Min and Max values of specific data type in solidity
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    // address declarations
    // Below is some address from Ganache
    address public addr = 0x7855A452803f280cE50243a4e24a5FDfAFe2aB8D;

    // bytes32 declaration
    // This will be used whenw e work with keccack256() later
    // Below is random bytes32 value from web
    bytes32 public b32 = 0x7465737400000000000000000000000000000000000000000000000000000000;


}