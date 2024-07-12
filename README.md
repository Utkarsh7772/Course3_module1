# **ErrorHandlingContract**

This Solidity smart contract demonstrates basic error handling in Ethereum's Solidity language. The contract includes the use of require, assert, and revert statements to ensure correct and secure functionality.

#**Overview**

The ErrorHandlingContract contract calculates the weight of an object given its mass, with error handling to ensure that only the contract owner can perform the calculation and that the inputs and outputs are valid.

# **Features**

Owner Restriction: Only the contract owner can call the weight function.
Error Handling: Uses require, assert, and revert statements to handle different error conditions.

# **Code Explanation**

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

# **Detailed Breakdown**

### **State Variables**

gravity: A constant value representing gravity, set to 10.
owner: Stores the address of the contract owner who deployed the contract.
Constructor

The constructor sets the owner to the address that deploys the contract using msg.sender.

### **Weight Function**

Visibility: public view means this function can be called by anyone and does not modify the state.
Parameters: Takes one parameter, _mass, representing the mass of the object.
Require Statement: Ensures that only the owner can call this function. If the caller is not the owner, the function throws an error with the message "You are not the owner".
Assert Statement: Ensures that the mass is greater than zero. If not, it throws an error.
Revert Statement: Checks if the calculated weight is non-negative. If the weight calculation results in a negative value, it throws an error with the message "Weight of the object cannot be zero".
Return Statement: Returns the calculated weight (_mass * gravity).

# **Deployment**

To deploy the contract, you can use Remix IDE, Truffle, or any other Ethereum development environment. Ensure that you have the necessary Ethereum client setup and a funded account to deploy the contract.

# **Usage**
 
Deploy the contract using your Ethereum account.
The account that deploys the contract becomes the owner.
Only the owner can call the weight function to calculate the weight of an object given its mass.

# **License**

This project is licensed under the MIT License. See the LICENSE file for details.
