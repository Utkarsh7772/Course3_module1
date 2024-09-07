// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract error{
    address public owner;
    uint public count=0;
    constructor(){
        owner=msg.sender;
    }
    function Require()   public {
        count++;
        require(msg.sender==owner,"caller is not Owner");
    }
    function Assert()   public {
        count++;
        assert(msg.sender==owner);
    }
    function Rivert()   public {
        count++;
        if(msg.sender!=owner){
            revert("Requires Owner");
        }
        else if(count>3){
            revert("COunt bigger than 3");
        }
    }
}
