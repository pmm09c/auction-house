const API_KEY = process.env.API_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS; //address of deployed contract

const { ethers, network } = require("hardhat");
const contract = require("../artifacts/contracts/HelloWorld.sol/HelloWorld.json");

// provider  -- eg alchemy
const alchemyProvider = new ethers.providers.AlchemyProvider("ropsten", API_KEY);

// signer -- address that's interacting with contract 
//      may require gas costs, needs to 'sign' the transaction
const signer = new ethers.Wallet(PRIVATE_KEY, alchemyProvider);

// contract instance
const helloWorldContract = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer);




async function main() {
    // contract.update("goodbye old message")

    // what's the current message
    const existingMessage = await helloWorldContract.message();
    console.log("Existing message: " + existingMessage);

    // update the message
    console.log("Updating the message...");
    const tx = await helloWorldContract.update("this is another message...");

    // waiting for txn to get mined -- cost
    await tx.wait();

    // read the new message
    const newMessage = await helloWorldContract.message();
    console.log("New message read is: " + newMessage);




}


main()
    .then( () => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
