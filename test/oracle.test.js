const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Oracle", () => {
  let oracle = null;
  before(async () => {
    const Oracle = await ethers.getContractFactory("Oracle");
    oracle = await Oracle.deploy();
    await oracle.deployed();
  });

  describe("Oracle contract", () => {
    it('Only an admin can set the price', async () => {
      const [_, addr1] = await ethers.getSigners();
      expect(oracle.connect(addr1).setPrice()).to.be.revertedWith("Operation can only be run by the admin");
    })
  })
});
