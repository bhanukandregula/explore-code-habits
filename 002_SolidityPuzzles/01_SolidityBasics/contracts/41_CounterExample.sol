// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


/**
    * If we don;t have access to the contracts, but if we wants to invokes their functions
    then we will use interfaces.

    * Interfaces allow us to call the other contracts, without having its code.
 */

// contract Counter {
//     uint public count;

//     function inc() external {
//         count += 1;
//     }

//     function dec() external {
//         count -= 1;
//     }
// }

// We will just need to create required functions, no need to implement those here.
interface ICounter {
    function count() external view returns (uint);
    function inc() external;
    function dec() external;
}

contract CallInterface {
    uint public count;

    function examples(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}