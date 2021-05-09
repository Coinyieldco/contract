//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

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
