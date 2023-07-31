// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; 

contract Degen {

    uint256 public totalSupply;
    address public owner;
    string public name = "DEGEN";
    string public symbol = "DGN";
    uint8 public decimals = 18;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint256) public balances;

    // Mint function
    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Only the contract owner can mint tokens.");
        require(amount > 0, "Amount must be greater than 0.");

        balances[to] += amount;
        totalSupply += amount;
    }

    // Burn function
    function burn(address from, uint256 amount) public {
        require(amount <= balances[from], "Amount exceeds balance.");

        balances[from] -= amount;
        totalSupply -= amount;
    }

    // Transfer function
    function transfer(address to, uint256 amount) public {
        require(amount <= balances[msg.sender], "Amount exceeds balance.");
        require(to != address(0), "Cannot transfer to the zero address.");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    // Redeem function
    function redeem(address to, uint256 amount, uint256 gameItem) public { 
        require(amount <= balances[to], "Amount exceeds balance");

        if (gameItem == 1) {
            require(amount >= 50, "Insufficient tokens for Game Item 1");
            burn(to, amount);
        } else if (gameItem == 2) {
            require(amount >= 100, "Insufficient tokens for Game Item 2");
            burn(to, amount);
        } else if (gameItem == 3) {
            require(amount>=200, "Insufficient tokens for Game Item 3");
            burn(to, amount);
        } else {
            revert("Invalid game item");
        }
    } 
}
