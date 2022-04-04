// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
    A calls B, send 100 wei
            B calls C, sends 50 wei
    A ----->B ----->C
                    msg.sender = B
                    msg.value = 50
                    execute code on C's state variables
                    use ETH in C
 */

 /**
    A calls B, send 100 wei
            B delegatecall C
    A ----> B -----------> C
                            msg.sender = A
                            msg.value = 100
                            execute code on B's state variables
                            use ETH in B
  */
contract TestDelegateCall {
        // state variables
        address public owner;
        uint public num;
        address public sender;
        uint public value;

        function setVars(uint _num) external payable {
                // num = _num;
                num = 2 * _num;
                sender = msg.sender;
                value = msg.value;
        }
}

contract DelegateCall {
        // order of the state varibles must be same between both the contracts.
        // If we add (or) dis-order, we will have an issue
        uint public num;
        address public sender;
        uint public value;

        function setVars(address _test, uint _num) external payable {
                // _test.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));

                // This is another way to delegatecall()
                (bool success, bytes memory data) = _test.delegatecall(
                        abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
                );
                require(success, "delagatecall failed");
        }
}