//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.1;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ERC721AuctionToken is ERC721{

    constructor(string memory name, string memory symbol) ERC721(name, symbol){
        
    }

    
    
}