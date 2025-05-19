// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string private greeting = "Hello, Ethereum!";

    // Public getter function
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}
