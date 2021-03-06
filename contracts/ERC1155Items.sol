//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";



contract G6Items is ERC1155{
    string public name = "G6 Fintech";
    string public symbol= "G6";

    uint public G6 = 1;
    uint public DL= 2;
    uint public PM = 3;
    uint public RRB = 4;
    uint public JA = 5;
    uint public SG = 6;


    constructor() public ERC1155 ("ipfs://bafybeibue5ynry7fudeomqxevhmbzfmvho7ya5ogxyasdhhimngwmh2ucq/{id}.json"){
        _mint (msg.sender, G6, 100, " ");
        _mint (msg.sender, DL, 1, " ");
        _mint (msg.sender, PM, 1, " ");
        _mint (msg.sender, RRB, 1, " ");
        _mint (msg.sender, JA, 1, " ");
        _mint (msg.sender, SG, 1, " ");

    }

}