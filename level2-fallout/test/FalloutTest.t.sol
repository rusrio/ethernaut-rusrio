// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Fallout} from "../src/Fallout.sol";

contract FalloutTest is Test {
    Fallout public fallout;
    address public bob;
    address public alice;

    function setUp() public {
        fallout = new Fallout();
        alice = makeAddr("alice");
        bob = makeAddr("bob");
    }

    function test_FirstBobClaimOwnershipThenAliceClaimOwnership() public {
        vm.prank(bob);
        console.log("---Bob claiming ownership---");
        fallout.Fal1out();
        console.log("Owner: ", fallout.owner());
        console.log("Bob address: ", bob);
        vm.prank(alice);
        console.log("---Alice claiming ownership---");
        fallout.Fal1out();
        console.log("Owner: ", fallout.owner());
        console.log("Alice address: ", alice);
    }

}
