// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet{

// variable for the contract owner
    address public owner;

    constructor(){ 
        owner = msg.sender;  
    }

    receive() external payable { }
    
    function withdraw() public {
        require(msg.sender == owner, "not authorized to withdraw");
        payable(owner).transfer(address(this).balance);  
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

}