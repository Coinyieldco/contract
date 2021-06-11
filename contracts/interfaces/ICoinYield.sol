// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 

interface ICoinYield {
  function deposit(uint256 amount) external payable;
  // function withdraw() external payable;
}