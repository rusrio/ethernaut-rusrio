// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CoinFlip} from "../src/CoinFlip.sol";

contract CounterTest is Test {
    CoinFlip public coinFlip;
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 lastHash;

    function setUp() public {
        coinFlip = new CoinFlip();
    }

    function test_Increment() public {
        for (uint256 i = 0; i < 10; i++) {
            uint256 blockValue = uint256(blockhash(block.number - 1));
            lastHash = blockValue;
            uint256 pseudoRandomResult = blockValue / FACTOR;
            bool side = pseudoRandomResult == 1 ? true : false;

            coinFlip.flip(side);
            vm.roll(block.number + 1);
            
        }
        console.log("Consecutive wins: ", coinFlip.consecutiveWins());
    }
}
