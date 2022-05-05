import { expect } from "chai";
import { ethers } from "hardhat";

const houseName = "TestAuctionHouse";

describe("G6AuctionBoilerplate", function () {

  it("should deploy with correct public vars", async function () {
    const accounts  = await ethers.getSigners();
    const G6Auction = await ethers.getContractFactory("G6AuctionBoilerplate");
    const g6auction = await G6Auction.deploy(houseName);
    await g6auction.deployed();

    // address matches
    expect(await g6auction.owner()).to.equal(accounts[0].address);

    // auction house name matches
    expect(await g6auction.auctionHouseName()).to.equal(houseName);

  });
});


// TODO
// move common setup to a beforeeach clause
// add tests for interacting with auction with some nft(s)

