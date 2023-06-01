const { hre, ethers, network } = require("hardhat");
require("hardhat-deploy")
require("dotenv").config({ path: ".env" });

async function main() {

  const { deployer } = await getNamedAccounts()
  // Deploy TransferEth Contract
  const transferEth = await ethers.getContractFactory("JoshToken", deployer);
  const deployedTransferEth = await transferEth.deploy();
  await deployedTransferEth.deployed();

  console.log('Deployed TransferEth Contract to ');
  console.log(deployedTransferEth.address);
}
// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});