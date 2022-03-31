// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ArrayReplaceLast {
    uint[] public scores;

    // [1,2,3,4] = remove(1) = [1,4,3]
    // replace the removed element postion with the last element
    function remove(uint _index) public {
        scores[_index] = scores[scores.length -1];
        scores.pop();
    }

    function test() external {
        scores = [1,2,3,4];
        remove(1);
        //[1,4,3]
        assert(scores.length == 3);
        assert(scores[0] == 1);
        assert(scores[1] == 4);
        assert(scores[2] == 3);

        remove(2);
        // [1,4]

        assert(scores.length == 2);
        assert(scores[0] == 1);
        assert(scores[1] == 4);

    }
}