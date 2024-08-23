**RailwayReservationSystem**
This Solidity smart contract demonstrates a basic railway reservation system on the Ethereum blockchain. The contract allows users to create trains, book tickets, and check seat availability while ensuring secure and correct functionality through the use of require, assert, and revert statements.

**Overview:**
The RailwayReservationSystem contract enables the creation of trains, ticket bookings, and retrieval of booking and train details. Error handling ensures that valid data is provided, such as non-empty train names and valid seat numbers, while preventing actions like duplicate bookings.

**Features:**
Train Management: Allows the creation of trains with a specific name and number of available seats.
Ticket Booking: Users can book tickets for a specific train, ensuring that the train exists and seats are available.
Error Handling: Uses require, assert, and revert statements to handle various error conditions, such as invalid train IDs or duplicate bookings.

**Code:** 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract RailwayReservationSystem {
    struct Train {
        string name;
        uint256 availableSeats;
        bool exists;
    }

    struct Booking {
        address passenger;
        uint256 trainId;
        uint256 seatNumber;
        bool exists;
    }

    mapping(uint256 => Train) public trains;
    mapping(uint256 => Booking) public bookings;
    mapping(address => mapping(uint256 => bool)) public passengerBookings;
    uint256 public trainCount;
    uint256 public bookingCount;

    event TrainCreated(uint256 trainId, string name, uint256 availableSeats);
    event TicketBooked(uint256 bookingId, address indexed passenger, uint256 trainId, uint256 seatNumber);

    // Create a new train
    function createTrain(string calldata name, uint256 availableSeats) external {
        require(bytes(name).length > 0, "Train name cannot be empty");
        require(availableSeats > 0, "Train must have at least one available seat");

        trainCount++;
        trains[trainCount] = Train({
            name: name,
            availableSeats: availableSeats,
            exists: true
        });

        emit TrainCreated(trainCount, name, availableSeats);
    }

    // Book a ticket on a train
    function bookTicket(uint256 trainId) external {
        require(trains[trainId].exists, "Train does not exist");
        require(trains[trainId].availableSeats > 0, "No available seats on this train");
        require(!passengerBookings[msg.sender][trainId], "You have already booked a ticket on this train");

        trains[trainId].availableSeats--;
        bookingCount++;
        bookings[bookingCount] = Booking({
            passenger: msg.sender,
            trainId: trainId,
            seatNumber: trains[trainId].availableSeats + 1,
            exists: true
        });

        passengerBookings[msg.sender][trainId] = true;

        emit TicketBooked(bookingCount, msg.sender, trainId, trains[trainId].availableSeats + 1);

        // Ensure the seatNumber is correctly assigned
        assert(bookings[bookingCount].seatNumber > 0);
    }

    // Check the available seats of a train
    function getAvailableSeats(uint256 trainId) external view returns (uint256) {
        require(trains[trainId].exists, "Train does not exist");
        return trains[trainId].availableSeats;
    }

    // Check the details of a booking
    function getBookingDetails(uint256 bookingId) external view returns (address passenger, uint256 trainId, uint256 seatNumber) {
        require(bookings[bookingId].exists, "Booking does not exist");
        Booking memory booking = bookings[bookingId];
        return (booking.passenger, booking.trainId, booking.seatNumber);
    }

    // Example function using revert() statement
    function exampleRevert() external pure {
        // Revert with a custom error message
        revert("Transaction Reverted");
    }

    fallback() external payable {
        revert("Direct payments not allowed");
    }

    receive() external payable {
        revert("Direct payments not allowed");
    }
}

**Detailed Breakdown**

*State Variables*

trains: A mapping that stores information about each train, using a unique train ID.
bookings: A mapping that stores booking details, indexed by a unique booking ID.
passengerBookings: A nested mapping that tracks whether a passenger has already booked a seat on a specific train.
trainCount: A counter to assign unique IDs to each train.
bookingCount: A counter to assign unique IDs to each booking.

**Events**

TrainCreated: Emitted when a new train is created, providing the train ID, name, and the number of available seats.
TicketBooked: Emitted when a ticket is booked, including the booking ID, passenger's address, train ID, and seat number.

*CreateTrain Function*

Visibility: external, meaning it can be called by other contracts or externally by users.
Parameters: Takes the train's name and the number of available seats as input.
Require Statements: Ensures the train name is not empty and that there is at least one available seat.
Actions: Increments trainCount and stores the new train details in the trains mapping. Emits the TrainCreated event.

*BookTicket Function*

Visibility: external, allowing it to be called by anyone.
Parameters: Takes the train ID as input.
Require Statements: Ensures the train exists, there are available seats, and the user has not already booked a seat on the train.
Actions: Decreases the available seats, increments bookingCount, stores the booking details, and emits the TicketBooked event.
Assert Statement: Ensures the seat number is correctly assigned and greater than zero.

*GetAvailableSeats Function*

Visibility: external view, meaning it can be called by anyone and does not modify the state.
Parameters: Takes the train ID as input.
Return: Returns the number of available seats for the specified train.

*GetBookingDetails Function*

Visibility: external view, allowing it to be called by anyone without modifying the state.
Parameters: Takes the booking ID as input.
Return: Returns the passenger's address, train ID, and seat number for the specified booking.
ExampleRevert Function
Purpose: Demonstrates the use of the revert statement by throwing a custom error message.

*Fallback and Receive Functions*

Purpose: Prevents direct payments to the contract by reverting any incoming transactions with a custom error message.
Deployment
To deploy the contract, you can use Remix IDE, Truffle, or any other Ethereum development environment. Ensure that you have the necessary Ethereum client setup and a funded account to deploy the contract.

**Usage**

Deploy the contract using your Ethereum account.
Create trains by specifying their name and the number of available seats.
Users can book tickets for a specific train by providing the train ID.
The contract owner or any user can check the available seats or booking details using the respective functions.

**License**

This project is licensed under the MIT License. See the LICENSE file for details.

