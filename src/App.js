import { useState } from 'react';
import { ethers } from 'ethers';
import G6Auction from './artifacts/contracts/G6AuctionBoilerplate.sol/G6AuctionBoilerplate.json';

const auctionAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";

function App() {

  const [greeting, setGreetingValue] = useState()
  const [userAccount, setUserAccount] = useState()
  const [amount, setAmount] = useState()


  // connects to metamask wallet
  async function requestAccount() {
    await window.ethereum.request({ method: 'eth_requestAccounts' });
  }

  async function getAuctionOwner() {
    if (typeof window.ethereum !== 'undefined') {
      const provider = new ethers.providers.Web3Provider(window.ethereum)
      console.log({ provider })
      const contract = new ethers.Contract(auctionAddress, G6Auction.abi, provider)
      try {
        const data = await contract.owner()
        console.log('data: ', data)
      } catch (err) {
        console.log("Error: ", err)
      }
    }    
  }

  async function getAuctionHouseName() {
    if (typeof window.ethereum !== 'undefined') {
      const provider = new ethers.providers.Web3Provider(window.ethereum)
      console.log({ provider })
      const contract = new ethers.Contract(auctionAddress, G6Auction.abi, provider)
      try {
        const data = await contract.auctionHouseName()
        console.log('data: ', data)
      } catch (err) {
        console.log("Error: ", err)
      }
    }    
  }

  async function getMarketItems() {
    if (typeof window.ethereum !== 'undefined') {
      const provider = new ethers.providers.Web3Provider(window.ethereum)
      console.log({ provider })
      const contract = new ethers.Contract(auctionAddress, G6Auction.abi, provider)
      try {
        const data = await contract.fetchMarketItems()
        console.log('data: ', data)
      } catch (err) {
        console.log("Error: ", err)
      }
    }    
  }


  async function createMarketItem() {
    if (!greeting) return
    if (typeof window.ethereum !== 'undefined') {
      await requestAccount()
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      console.log({ provider })
      const signer = provider.getSigner()
      const contract = new ethers.Contract(auctionAddress, G6Auction.abi, signer)
      const transaction = await contract.setGreeting(greeting)
      await transaction.wait()
    }
  }


  return (
    <div className="App">
      <header className="App-header">
        <button onClick={getAuctionOwner}>ViewOwner</button>
        <button onClick={getAuctionHouseName}>ViewAuctionHouseName</button>
        <button onClick={getMarketItems}>GetMarketItems</button>

        <br />
      </header>
    </div>
  );
}

export default App;
