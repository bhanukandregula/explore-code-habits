// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
    Note: Since we already used call() to send ETH; now
    Note: we are going to learn how to use call() to call another functions in another contract.
 */
contract TestCall {

    string public message;
    uint public x;
    event Log(string message);

    fallback() external payable {
        emit Log("Fallback is called");
    }

    function foo(string memory _message, uint _x) external payable returns (bool, uint) {
        message = _message;
        x = _x;
        return(true, 999);
    }

}

contract Call {
    bytes public data;
    // function callFoo(address _test) external payable {
    //     (bool success, bytes memory _data) = _test.call{ value: 111, gas: 5000}(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
    //     require(success, "call failed");
    //     data = _data;
    // }

    // removed the Gas:5000 condition here, just for the execution in remix
    function callFoo(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{ value: 111}(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
        require(success, "call failed");
        data = _data;
    }

    function callDoesNotExists(address _test) external {
        (bool success, ) = _test.call(abi.encodeWithSignature("doesNotExist()", ""));
        require(success, "call failed");
    }
}