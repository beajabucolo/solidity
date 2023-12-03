// Simple Ethereum Wallet Smart Contract
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    address public owner;

    // Event that will be triggered upon successful transfer of ethers
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // A modifier that ensures that only the owner of the contract can call the function
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Constructor, called when the contract is deployed
    constructor() {
        owner = msg.sender;
    }

    // Function for sending ethers to another address
    function sendEther(address payable to, uint256 amount) external onlyOwner {
        require(address(this).balance >= amount, "Insufficient funds");
        to.transfer(amount);
        emit Transfer(address(this), to, amount);
    }

    // Function for receiving ethers
    receive() external payable {
        // This feature allows the contract to accept ethers
    }
}
