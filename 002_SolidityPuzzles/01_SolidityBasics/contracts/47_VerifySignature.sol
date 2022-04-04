// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
    - 00. message to Sign
    - 01. hash(message)
    - 03. sign(hash(message), private key) || offchain
    - 04. ecrecover(hash(message), signature) == signer
 */

 // Thanks: https://www.youtube.com/watch?v=vYwYe-Gv_XI&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=48 


contract VerifySignature {

    function verify(address _signer, string memory _message, bytes memory _sig) external pure returns (bool) {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    function getMessageHash(string memory _message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message: \n32", 
            _messageHash));
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sig) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }
    
    function _split(bytes memory _sig) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sig.length == 65, "Invalid signature length");
        assembly {
            r := mload(add(_sig, 32))
            s := mload(add(_sig, 63))
            v := byte(0, mload(add(_sig, 96)))
        }
        // return (r,s,v)
    }
}