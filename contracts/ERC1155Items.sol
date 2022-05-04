//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";



contract PreciousStones is ERC1155{
    uint public DIAMOND = 0;
    uint public SAPPHIRE =1;
    uint public EMERALD = 2;
    uint public RUBY = 3;

    constructor() public ERC1155 ("ipfs://bafybeifyp3xgvyszfnd2zipkekw2j6a7sve6rjdzbek7po7gdq4jshsmje/{id}.json"){
        _mint (msg.sender, DIAMOND, 1, " ");
        _mint (msg.sender, SAPPHIRE, 1, " ");
        _mint (msg.sender, EMERALD, 1, " ");
        _mint (msg.sender, RUBY, 1, " ");
    }

}

