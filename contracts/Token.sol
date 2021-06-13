// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, ERC20Burnable, Pausable, Ownable {
  constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

  function pause() public onlyOwner {
    _pause();
  }

  function unpause() public onlyOwner {
    _unpause();
  }

  function mint(address to, uint256 amount) public {
      _mint(to, amount);
  }

  function burn(address from, uint256 amount) public {
    _burn(from, amount);
  }

  /**
   * Ensures token has not been paused.
   */
  function _beforeTokenTransfer(address from, address to, uint256 amount)
      internal
      whenNotPaused
      override
  {
      super._beforeTokenTransfer(from, to, amount);
  }
}