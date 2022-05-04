//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Auction{
    // who started auction, and will get paid
    address payable public owner;
    uint public startBlock;
    uint public endBlock;

    //off-chain info about item -- on IPFS
    //keep pointer to IPFS hash
    string public ipfsHash;

    enum State {Started, Running, Ended, Canceled}
    State public auctionState;

    uint public highestBindingBid;
    address payable public highestBidder;

    // keeping addresses, amounts of bidders in a map
    mapping (address => uint) public bids;

    // bit increments
    uint bidIncrement;


    // auction is owneed by whomever initiates the contract
    constructor() {
        owner = payable(msg.sender);
        auctionState = State.Running;

        // AUCTION DURATION -- declare how many blocks to allow until auction stops
        // 24 hr auction, so need current block plus a day's worth of blocks
        // a block created about every 15 sec, so 86400 / 15 sec is a day
        startBlock = block.number;
        endBlock = startBlock + 5760;
        ipfsHash = "";

        // bid increment in wei
        bidIncrement = 100;
    }


    // modifiers to enforce some business rules
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    modifier notOwner(){
        require(msg.sender != owner);
        _;
    }

    modifier afterStart(){
        require(block.number >= startBlock);
        _;
    }

    modifier beforeEnd(){
        require(block.number <= endBlock);
        _;
    }

    // figure out the min of two bids
    function min(uint x, uint y) pure internal returns (uint){
        if (x < y){
            return x;
        }
        else {
            return y;
        }
    }


    function placeBid() public payable notOwner afterStart beforeEnd {
        require(auctionState == State.Running);
        require(msg.value >= bidIncrement);

        // calculate currentBid, ensure its big enough
        uint currentBid = bids[msg.sender] + msg.value;
        require(currentBid > highestBindingBid);

        bids[msg.sender] = currentBid;

        // is this bid now highest biding, and greater than current highest bidder?
        if(currentBid <= bids[highestBidder]){
            highestBindingBid = min(currentBid + bidIncrement, bids[highestBidder]);
        } else {
            highestBindingBid = min(currentBid, bids[highestBidder] + bidIncrement);
            highestBidder = payable(msg.sender);
        }
    }

    // allowing owner to cancel
    function cancelAuction() public onlyOwner{
        auctionState = State.Canceled;
        // need to allow withdrawl for accounts if auction canceled or account not win at auction Ended
    }

    function finalizeAuction() public {
        require(auctionState == State.Canceled || block.number > endBlock);
        require(msg.sender == owner || bids[msg.sender] > 0);

        address payable recipient;
        uint value;

        // either auction was canceled, or auction ended and have highestbindingbid
        if (auctionState == State.Canceled){
            recipient = payable(msg.sender);
            value = bids[msg.sender];
        } else {
            // auction ended, not canceled 
            // owner gets highest binding bid
            if (msg.sender == owner){
                recipient = owner;
                value = highestBindingBid;
            } else {
                // bidder if highest, should get difference between their
                // highest bid and the final sale price
                if(msg.sender == highestBidder){
                    recipient = highestBidder;
                    value = bids[highestBidder] - highestBindingBid;
                } else {
                    // one of the bidders who lost the auction
                    recipient = payable(msg.sender);
                    value = bids[msg.sender];
                }
            }
        }

        recipient.transfer(value);

    }


}