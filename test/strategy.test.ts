import { expect} from "chai";
import { ethers } from "hardhat";
import { Strategy } from "../typechain/Strategy";
import { Token } from "../typechain/Token";

describe("Strategy", () => {
  let strategy: Strategy;
  let paymentToken: Token;
  let receivedStrategyToken: Token;
  before(async () => {
    const Strategy = await ethers.getContractFactory("Strategy");
    const TokenMock = await ethers.getContractFactory("Token");

    paymentToken = await TokenMock.deploy("Payment token mock", "PAYMOCK") as Token;
    receivedStrategyToken = await TokenMock.deploy("Received token mock", "RECEIVEMOCK") as Token;
    await paymentToken.deployed();
    await receivedStrategyToken.deployed();

    strategy = await Strategy.deploy(paymentToken.address, receivedStrategyToken.address) as Strategy;
    await strategy.deployed();
  });

  describe("Strategy contract", () => {
    it("It will fail to deposit without enough money", async () => {
      expect(strategy.deposit(100000)).to.be.reverted;
    })
  })
});