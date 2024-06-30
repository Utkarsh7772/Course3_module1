# Functions-Errors

Overview
The ErrorHandling smart contract demonstrates the use of different error handling mechanisms in Solidity: require, revert, and assert. These mechanisms help in validating inputs and ensuring the contract's state remains consistent.

Contract Description
State Variables
coinbalance (uint): This variable keeps track of the total coin balance.
quotient (uint): This variable stores the result of a division operation.
Functions
RequireCheck
function RequireCheck(uint score, uint coins) public payable {
    coinbalance += coins;
    require(score >= 100, "Score is less than 100. Transaction not possible");
}
This function adds the provided coins to the coinbalance. It then checks if the score is at least 100 using the require statement. If the score is less than 100, the transaction is reverted with the message "Score is less than 100. Transaction not possible".

RevertCheck
error ThrowError(string);
function RevertCheck(uint score, uint coins) public payable {
    coinbalance += coins;
    if (score < 100)
        revert ThrowError("Score is less than 100. Transaction not possible");
}
This function also adds the provided coins to the coinbalance. It then checks if the score is at least 100. If the score is less than 100, the transaction is reverted using a custom error (ThrowError), providing a message "Score is less than 100. Transaction not possible".

AssertCheck
function AssertCheck(uint a, uint b) public {
    assert(b != 0);
    quotient = a / b;
}
This function performs a division of a by b and stores the result in quotient. Before the division, it uses the assert statement to ensure that b is not zero. If b is zero, the transaction is reverted, indicating a serious error in the code logic.

Usage
Deploy the Contract: Deploy the ErrorHandling contract to the Ethereum blockchain.

RequireCheck: Call the RequireCheck function with appropriate score and coins values. Ensure the score is at least 100 to avoid transaction failure.

RevertCheck: Call the RevertCheck function with appropriate score and coins values. Ensure the score is at least 100 to avoid transaction failure.

AssertCheck: Call the AssertCheck function with values a and b. Ensure b is not zero to avoid transaction failure.
