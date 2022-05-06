pragma solidity ^0.8.1;

import "./auctiontoken.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


contract AuctionTokenCrowdsale is Crowdsale, MintedCrowdsale {
    constructor(
        uint256 rate,
        address payable wallet, 
        AuctionToken token 
    )
      public Crowdsale(rate, wallet, token)
      
    {
        
    }
}

contract AuctionTokenCrowdsaleDeployer {
    address public Auction_token_address;
    address public Auction_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet 
    ) public {
        AuctionToken token = new AuctionToken(name, symbol, 0);
        Auction_token_address = address(token);
        AuctionTokenCrowdsale AuctionToken_crowdsale = new AuctionTokenCrowdsale(1, wallet, token);
        Auction_crowdsale_address = address(AuctionToken_crowdsale);
        token.addMinter(Auction_crowdsale_address);
        token.renounceMinter();
    }
}
