// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ERC721AuctionToken is ERC721{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 currentTokenID;

    mapping (uint256 => string) public _tokenURIs;

    event tokenCreated(
        address indexed owner,
        uint tokenId,
        string uri
    );

    constructor(string memory name, string memory symbol) ERC721(name, symbol){
        
    }

    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal {
        require(_exists(tokenId), "ERC721AuctionToken: Setting URI for nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }

    function mintToken(address owner, string memory tokenURI)
        public  
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newTokenId = _tokenIds.current();
        _mint(owner, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        // emit tokenCreated(
        //     owner,
        //     newTokenId,
        //     tokenURI
        // );

        console.log("ERC721AuctionToken : token id is :");
        console.log(newTokenId);
        currentTokenID = newTokenId;
        return newTokenId;
    }

    function getCurrentTokenID() public view returns (uint256){

        console.log("ERC721AuctionToken : Current tokenID :");
        console.log(currentTokenID);
        return currentTokenID;
    }

    function tokenURI(uint256 _tokenId) public view virtual override returns(string memory) {
        require(
            _exists(_tokenId),
            "ERC721AuctionToken: URI set of nonexistent token"
        );
        return _tokenURIs[_tokenId];
    }
    
}