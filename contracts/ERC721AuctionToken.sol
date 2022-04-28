//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";

contract ERC721AuctionToken is ERC721, ERC721Enumerable, ERC721Mintable{

    constructor(string memory name, string memory symbol) ERC721Metadata(name_, symbol_){
        
    }
    
}