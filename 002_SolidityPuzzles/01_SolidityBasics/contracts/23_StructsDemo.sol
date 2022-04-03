// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StructsDemo {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {

        // These are the three different ways to initialize structs
        Car memory toyota = Car("Rav4", 2021, msg.sender);
        Car memory hundai = Car({ model: "Hundia Tuscon", year: 2021, owner: msg.sender });

        Car memory tesla; // this holds the default values of respective datatypes
        tesla.model = "Tesla";
        tesla.year = 2020;
        tesla.owner = msg.sender;

        // Push each car to array of cars
        cars.push(toyota);
        cars.push(hundai);
        cars.push(tesla);

        // below we are Initializing and also pushing to array at same time.
        cars.push(Car('Ferrari', 2020, msg.sender));

        // This way we can get the car values stored in the cars[] array
        Car memory _car = cars[0];
        _car.model;
        _car.year;
        _car.owner;

        // Also we can modity the values in the array
         Car storage _carUpdate = cars[1];
        _car.year = 1999;
        delete _car.owner; // this will reset the owner, which is 0
        delete cars[1]; // deleted the second car
    }
}