// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// This is bit complex, but just take the outcomes and keep the code safe.
// will be helpfull when time comes.
// Revisit again to understand more: 
// https://www.youtube.com/watch?v=YbRGTF1OGdM&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=27

contract TestContract01 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "Not owner");
        owner = _owner;
    }
}

contract TestContract02 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy{
    event Deploy(address);
    fallback() external payable {}

    function deploy(bytes memory _code) external payable returns (address addr) {
        // address addr;
        assembly {
            // create (v, p, n)
            // v = amount of ETH to send
            // p = pointer in memory to start of code]
            // n = size of code

            // to skip the forst 32 bytes in bytecode = 0x20
            // original compiled code startat after the first 32 bytes of code = mload
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }

        // return addr;

        require(addr != address(0), "deploy failed");
        emit Deploy(addr);
    }

    function execute(address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}

// we can also extract the bytecode from external tools like web3.js or ether.js etc
// But to simplyfi we are writing another helper contract here.
contract Helper {
    function getByteCode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract01).creationCode;
        return bytecode;
    }

    function getByteCode2(uint _x, uint _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract02).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}

