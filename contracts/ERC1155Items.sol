//SPDX-License-Identifier: Unlicense


pragma solidity >=0.6.0 <0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";



contract G6Items is ERC1155{
    string public name = "G6 Fintech";
    string public symbol= "G6";

    uint public G6 = 0;
    uint public DL= 1;
    uint public PM = 2;
    uint public RRB = 3;
    uint public JA = 4;
    uint public SG = 5;


    constructor() public ERC1155 ("ipfs://bafybeibue5ynry7fudeomqxevhmbzfmvho7ya5ogxyasdhhimngwmh2ucq/{id}.json"){
        _mint (msg.sender, G6, 10**10, " ");
        _mint (msg.sender, DL 1, " ");
        _mint (msg.sender, PM, 1, " ");
        _mint (msg.sender, RRB, 1, " ");
        _mint (msg.sender, JA, 1, " ");
        _mint (msg.sender, SG, 1, " ");

    }

