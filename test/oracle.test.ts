import { expect} from "chai";
import { ethers } from "hardhat";
import { Oracle } from "../typechain/Oracle";

describe("Oracle", () => {
  let oracle: Oracle;
  before(async () => {
    const Oracle = await ethers.getContractFactory("Oracle");
    oracle = await Oracle.deploy() as Oracle;
    await oracle.deployed();
  });

  describe("Oracle contract", () => {
    it('Only an admin can set the price', async () => {
      const [_, addr1] = await ethers.getSigners();
      expect(oracle.connect(addr1).setPrice()).to.be.revertedWith("Operation can only be run by the admin");
    })
  })
});
