const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("EvianToken", function () {
  async function deployToken() {
    const Token = await ethers.getContractFactory("EvianToken");
    const token = await Token.deploy(1000000);
    await token.waitForDeployment();
    return token;
  }

  it("deploys with initial supply", async function () {
    const token = await deployToken();
    const totalSupply = await token.totalSupply();
    expect(totalSupply).to.equal(ethers.parseUnits("1000", 18));
  });

  it("sets the owner correctly", async function () {
    const [owner] = await ethers.getSigners();
    const token = await deployToken();
    expect(await token.owner()).to.equal(owner.address);
  });
});
