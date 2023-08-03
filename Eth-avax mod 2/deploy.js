const { ethers, upgrades } = require("hardhat");

async function main() {
  // Get the account used for deployment
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy the EthersTransfer contract
  const EthersTransfer = await ethers.getContractFactory("EthersTransfer");
  const ethersTransfer = await EthersTransfer.deploy();

  await ethersTransfer.waitForDeployment();

  console.log("EthersTransfer contract deployed to:", ethersTransfer.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
