// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Structs allows us to express multiple choices
// Where as Enum allows us to express more choices

contract EnumDemo {
    // Check shipping status
    // Note: First item defined in the Enum will be the default value fo respective Enum
    // Just like 0 for unit, int and address value.

    // None, = 0
    // Pending, = 1
    // Completed, = 2
    // Rejected, = 3
    // Cancelled, = 4
    // Shipped = 5
    enum Status {
        None, 
        Pending,
        Completed,
        Rejected,
        Cancelled,
        Shipped
    }

    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        delete status;
    }
}