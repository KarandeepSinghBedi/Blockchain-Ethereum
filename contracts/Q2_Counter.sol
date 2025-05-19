// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 private value = 0; // Initial value is 1

    function increment() public {
        value = value + 1;
    }
    
    // Read-only getter function
    function getValue() public view returns (uint256) {
        return value;
    }
}