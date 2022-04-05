// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MultiDelegateCall {
    error DelegatecallFailed();

    function multiDelegateCall(bytes[] calldata data) 
        external payable returns (bytes[] memory results) {
            results = new bytes[](data.length);
            for(uint i; i < data.length; i++){
                (bool ok, bytes memory res) = address(this).delegatecall(data[i]);
                if(!ok){
                    revert DelegatecallFailed();
                }
                results[i] = res;
            }
        }
}

// why we use multiDelegateCall ? why not multi call ?
// alice => multi call -- call => test (msg.sender = multi call)
contract TestMultiDelegateCall is MultiDelegateCall {
    event Log(address caller, string func, uint i);

    function function01(uint x, uint y) external {
        emit Log(msg.sender, "function 01", x + y);
    }

    function function02() external returns (uint) {
        emit Log(msg.sender, "function 02", 2);
        return 111;
    }

    mapping(address => uint) public balanceOf;

    function mint() external payable {
        balanceOf[msg.sender] += msg.value;
    }
}

contract Helper {
    function getFunction01Data(uint x, uint y)
        externnal pure returns (bytes memory){
            return abi.encodeWithSelector(TestMultiDelegateCall.function01.selector, x, y);
    }

    function getFunction02Data(uint x, uint y)
        externnal pure returns (bytes memory){
            return abi.encodeWithSelector(TestMultiDelegateCall.function02.selector, x, y);
    }

    function getMintData() external pure returns (bytes memory) {
        return abi.encodeWithSelector(TestMultiDelegateCall.mint.slector);
    }

}