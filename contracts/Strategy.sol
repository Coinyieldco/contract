// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol"; 
import "hardhat/console.sol";
import "./Token.sol";

contract Strategy is ReentrancyGuard {
  IERC20 private  paymentToken;
  Token private  strategyToken;

  constructor(IERC20 _paymentToken, Token _strategyToken) {
    paymentToken = _paymentToken;
    strategyToken = _strategyToken;
  }

  // amount (1e18) in strategy tokens
  function deposit(uint256 amount) external payable nonReentrant {
    // Transfer payment token from msg.sender to contract
    paymentToken.transferFrom(msg.sender, address(this), amount);

    // ToDo: Calculate how much strategy tokens will be transfered

    // Mint strategy token and send it user
    strategyToken.mint(msg.sender, amount);
  }

  // amount (1e18) in strategy tokens
  function withdraw(uint256 amount) external payable nonReentrant {
    // Burn strategy tokens
    strategyToken.burn(msg.sender, amount);

    // ToDo: Calculate how much payment tokens will be transferred

    // Send payment token to user
    paymentToken.transfer(msg.sender, amount);
  }
}