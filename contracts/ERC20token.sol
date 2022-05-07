pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract FintechToken is ERC20 {
    address payable owner;
    
    constructor(uint256 initialSupply) ERC20 ("FintechToken", "FTT") public {
            _mint(msg.sender, initialSupply);
    }
    

}

