// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RestrictedData {
    
    uint private data;

    address public owner;

    constructor() {
        owner = msg.sender;
    }
    
    function setData(uint x) public {
        require(msg.sender == owner, "Only owner can set data.");
        data = x;
    }

    function getData() public view returns (uint) {
        return data;
    }
        
}
