// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
    - 00. message to Sign
    - 01. hash(message)
    - 03. sign(hash(message), private key) || offchain
    - 04. ecrecover(hash(message), signature) == signer
 */
contract VerifySignature {

}