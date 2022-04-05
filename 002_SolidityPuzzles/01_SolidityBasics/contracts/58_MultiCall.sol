// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestMultiCall {
    function function01() external view returns (uint, uint) {
        return (1, block.timestamp);
    }

    function function02() external view returns (uint, uint) {
        return (2, block.timestamp);
    }

    function getData01() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.function01.selector);
    }

    function getData02() external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.function02.selector);
    }
}

contract MultiCall {
    function multiCall(address[] calldata targets, bytes[] calldata data) 
        external view returns (bytes[] memory) {
            // check length of the targets = length of the data
            require(targets.length == data.length, "target length != length data");
            bytes[] memory results =  new bytes[](data.length);
            for(uint i; i< targets.length; i++) {
                (bool success, bytes memory result) = targets[i].staticcall(data[i]);
                require(success, "call failed");
                results[i] = result;
            }
            return results;
        }
}