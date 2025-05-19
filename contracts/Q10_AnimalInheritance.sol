// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Animal{

    function speak () public pure virtual returns (string memory){
        return "Speaking";
     }
 
}

contract Dog is Animal{

    function speak() public pure override(Animal) returns(string memory){
        return ("Woof");
    }
}