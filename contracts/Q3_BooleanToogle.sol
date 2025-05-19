// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LightSwitch{
    // Public variable to store boolean value 
    bool private toggled = false;

    function toggle() public {
        toggled = !toggled;
    }

    function status() public view returns (bool) {
        return toggled;
    }
}