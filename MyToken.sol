// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyToken {
    string public name = "Evian Token";
    string public symbol = "EVT";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * 10 ** 18;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public {
        require(balanceOf[msg.sender] >= value, "Not enough balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
    }
}
