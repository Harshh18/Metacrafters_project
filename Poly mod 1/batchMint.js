// This script batch mints Indian_ETH ERC721A tokens.

// Import required libraries
const { ethers } = require("hardhat");
require("dotenv").config();

async function main() {
  // Get private key from env
  const privateKey = process.env.PRIVATE_KEY;

  // The URL of the network provider
  const networkAddress = "https://ethereum-goerli.publicnode.com";

  // Create a provider using the URL
  const provider = new ethers.providers.JsonRpcProvider(networkAddress);

  // Create a signer from the private key and provider
  const signer = new ethers.Wallet(privateKey, provider);

  // Tthe address of the deployed contract
  const contractAddress = "0xDea1998751BCB79535F4AA9A0934A24063D4bD76";

  // Get the contract factory and attach it to the signer
  const IndianNFT = await ethers.getContractFactory("Wolverine", signer);
  const contract = await IndianNFT.attach(contractAddress);

  // Call the mint function on the contract to mint 5 tokens
  await contract.mint(5);

  // Log a message to the console to indicate that the tokens have been minted
  console.log("5 NFTs minted successfully!");
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
