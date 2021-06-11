// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "./Strategy.sol";
import "./Token.sol";

contract USDTStrategy is Strategy {
  address internal constant USDT_ADDRESS = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
  constructor() Strategy(IERC20(USDT_ADDRESS), new Token("CoinYield USDT Strategy", "CYUSDT")) {}
}