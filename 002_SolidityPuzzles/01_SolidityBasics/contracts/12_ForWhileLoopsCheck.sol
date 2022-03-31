// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ForWhileLoopsCheck {

    function loops() external pure {
        for(uint i=0; i<10; i++){
            // code here
            if (i == 3){
                continue; // This will skip one loop
            } 
            // more code

            if(i==5){
                break; // this will exit the loop
            }  
        }
        
        uint j=0;
        while(j<10){
            // code
            j++;
        }
    }

    function sum(uint _n) external pure returns (uint){
        uint s = 0;
        for(uint i=0; i<=_n; i++){
            s = s + i;
        }
        return s;
    }


}