require("@nomicfoundation/hardhat-toolbox");
require("hardhat-deploy")
require("dotenv").config({ path: ".env" });

/** @type import('hardhat/config').HardhatUserConfig */

const RPC_URL = process.env.ALCHEMY_RPC_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY

module.exports = {
  solidity: "0.8.18",
  networks: {
    sepolia: {
      url: RPC_URL,
      chainId: 11155111,
      accounts: [PRIVATE_KEY],
      gasPrice: 35000000000,
      blockConfirmations: 5,
    },
    hardhat: {
      chainId: 31337,
    },

    localhost: {
      chainId: 31337,
    },
  },

  namedAccounts: {
    deployer: {
      default: 0,
    }
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};
