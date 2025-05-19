// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {

    address public Admin;
    bool public votingActive;
    mapping(address => bool) public votedAddress;
    uint public yesVotes;
    uint public noVotes;

    constructor() {
        Admin = msg.sender;
        
    }

    function startvoting() public{
        require(msg.sender == Admin, "Only Admin can start voting.");
        votingActive = true;
        yesVotes = 0;
        noVotes = 0;
    }

    function endVoting() public{
        require(msg.sender == Admin, "Only Admin can start voting.");
        votingActive = false;
    }

    function voting(bool vote) public{
        require(votingActive, "Voting is not active.");
        require(!votedAddress[msg.sender], "Already voted.");
        if(vote){ 
            yesVotes++; 
        }
        else{ 
            noVotes++;
        }
        votedAddress[msg.sender] = true;
    } 

    function getResult () public view returns (uint, uint){
        require(!votingActive, "Voting is still active.");
        return(yesVotes, noVotes);
    }

}