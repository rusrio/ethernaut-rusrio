// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Elevator} from "../src/Elevator.sol";
import {Building} from "../src/Building.sol";

contract CounterTest is Test {

    Elevator public elevator;
    Building public building;

    function setUp() public {
        elevator = new Elevator();
        building = new Building();
    }

    function test_Elevator() public {
        console.log("Floor: ", elevator.floor());
        console.log("Top: ", elevator.top());
        console.log("---Elevator going to floor number 5---");
        vm.prank(address(building));
        elevator.goTo(5);
        console.log("Floor: ", elevator.floor());
        console.log("Top: ", elevator.top());
    }
}
