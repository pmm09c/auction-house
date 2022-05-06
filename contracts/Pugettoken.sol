pragma solidity ^0.8.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

contract AuctionToken is ERC20, ERC20Detailed, ERC20Mintable {
    address payable owner;
    
    constructor(string memory name,
        string memory symbol,
        uint initial_supply) ERC20Detailed("AuctionToken", "ACT", 18) public {
    }
    

}