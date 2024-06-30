// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract ErrorHandlingContract {
    // State variable to hold the constant value of gravity
    uint private constant gravity = 10;

    // State variable to hold the address of the contract owner
    address private owner;

    // Constructor to initialize the owner to the address that deploys the contract
    constructor() {
        owner = msg.sender;
    }

    // Function to calculate the weight of an object given its mass
    function weight(uint _mass) public view returns (uint) {
        // Require statement to ensure that only the owner can call this function
        require(owner == msg.sender, "You are not the owner");

        // Assert statement to ensure that the mass is greater than zero
        assert(_mass > 0);

        // Check to ensure that the calculated weight is non-negative
        // This is to demonstrate the use of revert statement
        if ((_mass * gravity) < 0) {
            revert("Weight of the object cannot be zero");
        }

        // Return the calculated weight
        return _mass * gravity;
    }
}