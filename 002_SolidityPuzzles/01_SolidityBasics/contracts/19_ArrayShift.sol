// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ArrayShift {
    uint[] public scores;

    function example() public {
        scores = [23,65,87];
        delete scores[1]; // [23,0,87]
    }
    
    // [1,2,3,4,5,6] = remove(2) = [1,2,4,5,6,6] = [1,2,4,5,6]
    function remove(uint _score) public {
        require(_score < scores.length, "Ibdex out of bounds");
        for(uint i = _score; i < scores.length -1; i++){
            scores[i] = scores[i+1];
        }
        scores.pop();
    }

    function test() external {
        scores = [1,2,3,4,5,6];
        remove(2);
        // [1,2,4,5]
        assert(scores[0] == 1);
        assert(scores[1] == 2);
        assert(scores[2] == 4);
        assert(scores[3] == 5);
        assert(scores.length == 4);

        scores = [23];
        remove(0);
        //[]
        assert(scores.length == 0);

    }
}