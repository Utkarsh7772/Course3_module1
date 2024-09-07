# Erros In Solidity

This Solidity program is a simple  program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to use various error control Functions.

## Description

This "error" contract is a Solidity program that implements error handling mechanisms. It keeps track of a count variable and restricts access to certain functions based on the caller's identity. The contract owner is set during deployment.

This contract provides three functions: "Require", "Assert", and "Rivert". The "Require" function increments the count and ensures that only the contract owner can execute the function by using the "require" statement. Similarly, the "Assert" function increments the count and uses the "assert" statement to verify the caller's identity. If the conditions are not met in either function, the transaction is reverted.

The "Rivert" function increments the count and uses a conditional statement to check if the caller is the owner. If it's not, the transaction is reverted with an appropriate error message. Additionally, if the count variable exceeds 3, another error message is triggered, and the transaction is reverted. These error handling techniques showcase different ways to handle exceptions and enforce access control within the contract.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., <YourFileNameHere>.sol). Copy and paste the code of this file --> [FileLink](https://github.com/Utkarsh7772/Course3_module1/blob/main/function_error.sol)


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile <YourFileNameHere>.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "<YourFileNameHere>" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the  various functions.

## Authors

Utkarsh Gupta
[@Utkarsh_Gupta](https://www.linkedin.com/in/utkarsh-gupta-b099b6282/)
