// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {NaughtCoin} from "../src/NaughtCoin.sol";
import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract NaughtCoinTest is Test {

    NaughtCoin public naughtCoin;
    address public alice;
    address public bob;


    function setUp() public {
        alice = makeAddr("alice");
        bob = makeAddr("bob");
        naughtCoin = new NaughtCoin(alice);
        console.log(alice);
        console.log(bob);
    }

    function test_transferTokensToBob() public {
        vm.startPrank(alice);
        console.log("--- Alice transfering tokens to Bob using `transferFrom()` ---");
        ERC20(naughtCoin).approve(alice, type(uint256).max);
        ERC20(naughtCoin).transferFrom(alice, bob, ERC20(naughtCoin).balanceOf(alice));
        
        console.log("Alice balance: ", ERC20(naughtCoin).balanceOf(alice));
        console.log("Bob balance: ", ERC20(naughtCoin).balanceOf(bob));
    }

}
