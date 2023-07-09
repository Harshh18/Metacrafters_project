// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract OwnershipContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function onlyOwner() public view {
        require(msg.sender == owner, "Only the owner can call this function.");
    }

    function onwerHere() public view {
        if(msg.sender!= owner){
            revert("The caller is not the owner.");
        }
    }

    function Owner() public view {
        assert(msg.sender == owner);
    }
}
