// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";

async function main() {

  // We get the contract to deploy
  const auctionName = "G6AuctionHouse";
  const G6AuctionBoilerplate = await ethers.getContractFactory("G6AuctionBoilerplate");
  const g6_auction_boilerplate = await G6AuctionBoilerplate.deploy(auctionName);
  
  await g6_auction_boilerplate.deployed();

  console.log("G6AuctionBoilerplate contract deployed to:", g6_auction_boilerplate.address);
  
}

// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
