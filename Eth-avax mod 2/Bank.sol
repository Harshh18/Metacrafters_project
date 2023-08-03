// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EthersTransfer {
    address public owner;
    string public name;
    
    constructor() {
        owner = msg.sender;
        name = "Harsh";
    }
    
    function transfer(address payable recipient) external payable {
        recipient.transfer(msg.value);
    }
    
    function getBalance() external view returns (uint256) {
        return msg.sender.balance / 1 ether;
    }
}
