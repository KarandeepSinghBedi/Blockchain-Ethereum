// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfund {

    address public owner;
    uint public goal;
    uint public deadline;
    uint public raised;
    bool public withdrawn;

    mapping(address => uint) public contributions;

    constructor (uint userGoal, uint durationSeconds) {
        goal = userGoal;
        deadline = block.timestamp + durationSeconds; 
        owner = msg.sender;
    }

    receive() external payable {
        require(block.timestamp <= deadline);
        contributions[msg.sender] += msg.value;
        raised += msg.value; 
    }
    
    function getBalance() public view returns (uint) { 
        return address(this).balance; 
    } 

    function withdraw () payable public{
        require(msg.sender == owner, "Not authorized"); 
        require(block.timestamp >= deadline, "Deadline Not Reached");
        require(raised >= goal, "Goal not reached");
        require(!withdrawn, "Already withdrawn");
        withdrawn = true;
        payable(owner).transfer(raised);

    }

    function refund() public {    
        require(block.timestamp >= deadline, "Deadline Not Reached");
        require(raised < goal, "Goal was reached");
        uint amount = contributions[msg.sender];
        require(amount > 0, "No contributions made");
        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    
}