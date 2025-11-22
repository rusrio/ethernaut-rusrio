// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

contract TokenTest is Test {
    Token public token;
    address public alice;
    address public bob;

    function setUp() public {
        alice = makeAddr("alice");
        bob = makeAddr("bob");
        console.log("---Alice deploying contract---");
        vm.prank(alice);
        token = new Token(20);
        console.log("Alice balance: ", token.balanceOf(alice));
    }

    function test_Increment() public {
        vm.prank(alice);
        console.log("---Alice transfering 30 tokens to bob---");
        token.transfer(bob, 30);
        console.log("Alice balance: ", token.balanceOf(alice));
    }

}
