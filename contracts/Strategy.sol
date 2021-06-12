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

  function deposit(uint256 amount) external payable nonReentrant {
    // Transfer payment token from msg.sender to contract
    paymentToken.transferFrom(msg.sender, address(this), amount);

    // Mint strategy token and send it user
    strategyToken.mint(msg.sender, amount);
  }
}