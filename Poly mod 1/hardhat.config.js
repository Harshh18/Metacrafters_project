require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    mumbai:{
      url: `https://rpc.ankr.com/polygon_mumbai`,
      accounts: [process.env.PRIVATE_KEY]
    },
    goerli: {
      url: 'https://ethereum-goerli.publicnode.com',
      accounts: [process.env.PRIVATE_KEY],
    },
  }
};
