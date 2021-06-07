// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "./interfaces/ICoinYield.sol";
import "./tokens/cyusdt.sol";

contract USDTStrategy is ICoinYield {
  function deposit(uint256 amount) override external payable nonReentrant {
    IERC20 usdt = IERC20(msg.sender);
    CYUSDTToken cyusdt = new CYUSDTToken();

    // Transfer amount USDT tokens from msg.sender to contract
    usdt.transferFrom(msg.sender, address(this), amount);

    // Send amount tokens to msg.sender
    cyusdt.mint(msg.sender, amount);
  }
}