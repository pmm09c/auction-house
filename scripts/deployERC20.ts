// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  // const [deployer] = await ethers.getSigners();
  //
  const FintechToken = await hre.ethers.getContractFactory("FintechToken");
  console.log('Deploying FintechToken...');
  const token = await FintechToken.deploy('1000000');
  await token.deployed()
  

//  console.log("Greeter deployed to:", greeter.address);
  console.log("FTT deployed to:", token.address);
  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
