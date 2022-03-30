pragma solidity ^0.8.3;

/** Functions outside contract Start ******************************************* */

// Note: We can create functions outside the contract, 
// so we can make use of those to inside contract and also other 
// contracts by importing them

function helper(uint X) view returns (uint){
    return X * 2;
}

contract TestHelper{
    function test() external view returns (uint){
        return helper(123);
    }
}



/** Functions outside contract End ******************************************* */

/** CustomErrorFunctionality Start **********************************************************/

// Declaration of custom error, it could inside or outside of the contract
error Unauthorized(address caller);

contract CustomErrorFunctionality {
    // Custom Error functionality
    // Note: Longer the error message is, more is the GAS its consule whele performing the transaction
    address payable owner = payable(msg.sender);
    
    function withdraw() public {
        if(msg.sender != owner){
            // 23642 Gas
            //revert("Long error message is error error error error error errro");
            revert Unauthorized(msg.sender);
        }
        owner.transfer(address(this).balance);
        
    }
} 

/* CustomErrorFunctionality ****************************************************************** */

/* SafeMath Start ****************************************************************************** */
contract SafeMath {
    // thsi function will throw an error in solidity version 0.8 and above
    function testUnderflow() public pure returns (uint) {
        uint x = 0;
        x--;
        return x;
    }

    // This will work well with underflow value in version 0.8 and above
    function testUncheckedUnderflow() public pure returns (uint) {
        uint x = 0;
        unchecked { x--; }
        return x;
    }
}
/* Safemath End ********************************************************************************** */