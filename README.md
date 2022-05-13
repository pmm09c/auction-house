# Modern Distributed Application Development
Fintech Project 3 - Building a web3 application using modern techniques.  

---

## Project Overview  
Using a marketplace of ERC tokens as a guiding light, this project is a learning and building journey for how to setup, build, deploy and interact with a web3 application using modern development techniques.  

Specifically, using [solidity](https://docs.soliditylang.org/en/v0.8.13/), [ERC-20](./contracts/ERC20token.sol), [ERC-721](./contracts/), and [ERC-1155](./contracts/ERC1155Items.sol) contracts were authored and deployed to a the [rinkeby](https://www.rinkeby.io/#stats) testnet. Additionally, a [marketplace](./contracts/G6AuctionBoilerplate.sol) contract was deployed.  Tokens were minted, and items were to be listed for sale on the marketplace.  Lastly a primative [javascript script](./scripts/interact.js) and [web view](./src/App.js) was proven out to be able to interact with the contracts.  

[Presentation slides](media/g6_marketplace_preso.pdf)  

See [setup](#setup) and [usage](#usage) below for details on how to work with this repository.  

See [Technologies Used](#technologies-used) for details on technologies used to build, deploy, interact.  

## Technologies Used  
- [Hardhat](https://hardhat.org/) , development environment for compilation, testing, deploying, verifying contracts
- [Solidity](https://docs.soliditylang.org/en/v0.8.13/) , language for authoring smart contracts
- [Typescript](https://www.typescriptlang.org/) , language for authoring deploy, test, view/interactive scripts
- [Alchemy](https://www.alchemy.com/) , for hosting deployed app on testnet
- [Rinkeby](https://www.rinkeby.io/#stats) , an ethereum testnet
- [Pinata](https://www.pinata.cloud/) , for hosting images of minted tokens/nfts
- [Etherscan](https://etherscan.io/) , for viewing transactions/contracts on chain, also can interact if verified
- [React](https://reactjs.org/), for authoring web view
- [ethers.js](https://docs.ethers.io/v5/) , library for use in scripts/web to interact with contracts programatically
- [node.js](https://nodejs.org/en/download/), framework for managing local environment, and runtime for typescript/javaascript


## Setup

You'll need [node](https://nodejs.org/en/download/) and [yarn](https://yarnpkg.com/getting-started/usage) in order to work with this repo.  

### Install Node
- Download and run the [NodeJs Installer](https://nodejs.org/en/download/) for your os

### Verify Installation, and install repo
```
## should output version of node
node --version

# enable yarn by enabling corepack
corepack enable

# cd into the repo and install via yarn:
yarn install

The repo should then be ready to run the various `npx` commands within.
```

### .env file setup
To deploy to a testnet, interact with your wallet and or deployed contract(s), you must put in values into an `.env` file at the root of the repo. Some key values:  

```
ETHERSCAN_API_KEY="<to_validate_with_etherscan>"
PRIVATE_KEY="<your_wallet_private_key>"
API_KEY="<eg_an_alchemy_api_key>"
API_URL="<eg_an_alchemy_api_URL>"
ROPSTEN_URL="<eg_an_alchemy_api_URL_ropsten>"
CONTRACT_ADDRESS="deployed_contract_address"  // used in the interact script only
```

## Usage

Some key npx commands for working with hardhat:  

```
# start up a local hardhat node with wallets and test ETH
npx hardhat node

# compile contracts
npx hardhat compile

# deploy to localhost node
npx hardhat run scripts/<deply_script> --network localhost  # or ropsten|rinkeby

# deploy to testnet
npx hardhat run scripts/<deply_script> --network ropsten|rinkeby

# run test(s)
npx hardhat run test/<name_of_test> --network localhost  # or ropsten|rinkeby

# verify contract on Etherscan
npx hardhat verify --network rinkeby|ropsten <DEPLOYED_CONTRACT_ADDRESS>

# run react server/pages, runs on localhost:3000
npm start

```

## Contributors

[Peter Morales](https://github.com/pmm09c)  
[Shivangi Gupta](https://github.com/shivangiuw)   
[Rupika Ranjan](https://github.com/rupikaranjan)  
[Jaime Aranda](https://github.com/Aranda80)  
[David Lopez](https://github.com/sububer)  

---

## License

MIT
