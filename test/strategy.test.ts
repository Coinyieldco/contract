import { expect} from "chai";
import { ethers } from "hardhat";
import { Strategy } from "../typechain/Strategy";
import { Token } from "../typechain/Token";

describe("Strategy", () => {
  const defaultAmount = 1000; // Amount of tokens that will be requested
  let strategy: Strategy;
  let paymentToken: Token;
  let strategyToken: Token;
  let defaultAddress: any;

  beforeEach(async () => {
    const Strategy = await ethers.getContractFactory("Strategy");
    const Token = await ethers.getContractFactory("Token");
    [defaultAddress] = await ethers.getSigners();

    paymentToken = await Token.deploy("Payment token mock", "PAYMOCK") as Token;
    strategyToken = await Token.deploy("Received token mock", "RECEIVEMOCK") as Token;

    strategy = await Strategy.deploy(paymentToken.address, strategyToken.address) as Strategy; 
  });

  describe("Strategy contract", () => {
    it("will not allow an account to deposit without value", async () => {
      // mint less than default amount (although increase allowance to default amount)
      await paymentToken.mint(defaultAddress.address, defaultAmount - 100);
      await paymentToken.increaseAllowance(strategy.address, defaultAmount);

      expect(strategy.deposit(defaultAmount)).to.be.reverted;
      expect(await strategyToken.balanceOf(defaultAddress.address)).to.equal(0);
    });

    it("will mint a strategy token upon successful deposit", async () => {
      await paymentToken.mint(defaultAddress.address, defaultAmount);
      await paymentToken.increaseAllowance(strategy.address, defaultAmount);
      
      expect(await strategy.deposit(defaultAmount)).to.be.ok;
      expect(await strategyToken.balanceOf(defaultAddress.address)).to.equal(defaultAmount);
    });
  });
});