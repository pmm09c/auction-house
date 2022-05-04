// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract G6NFT is ERC721URIStorage {

    // auto inits to zero
    uint public tokenCount;
    // takes name and symbol
    constructor() ERC721("G6 NFT", "GSIX"){}

    function mint(string memory _tokenURI) external returns(uint) {
        tokenCount ++;
        // _safeMint(address to, uint256 tokenId)
        _safeMint(msg.sender, tokenCount);

        // _setTokenURI(uint256 tokenId, string memory _tokenURI)
        _setTokenURI(tokenCount, _tokenURI);
        return(tokenCount);
    }
}