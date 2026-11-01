// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    mapping(address => uint256) private balances;

    // Deposit ether into your account
    function deposit() public payable {
        require(msg.value > 0, "Send some ether");
        balances[msg.sender] += msg.value;
    }

    // Withdraw amount (in wei)
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "Transfer failed");
    }

    // Show your balance (in wei)
    function showBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
