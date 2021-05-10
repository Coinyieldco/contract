// SPDX-License-Identifier: BUSL-1.1
pragma solidity =0.7.6;

import "hardhat/console.sol";

contract Oracle {
  address admin;

  modifier onlyAdmin() {
    require(msg.sender == admin, "Operation can only be run by the admin");
    _;
  }

  constructor() {
    admin = msg.sender;
  }

  function setPrice() public onlyAdmin {

  }
}
