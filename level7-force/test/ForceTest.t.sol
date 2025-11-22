// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Force} from "../src/Force.sol";
import {ForceSender} from "../src/ForceSender.sol";

contract ForceTest is Test {

    Force public force;
    ForceSender public forceSender;
    address public alice;

    function setUp() public {
        force = new Force();
        forceSender = new ForceSender();
        alice = makeAddr("alice");
        vm.deal(alice, 1 ether);
    }

    function test_sendEth() public {

        address forceContractAddress = address(force);

        console.log("Force contract balance: ", address(force).balance);
        console.log("---Alice sending ETH to Force contract via ForceSender contract---");
        vm.startPrank(alice);
        (bool success, ) = address(forceSender).call{value: 0.5 ether}("");
        forceSender.forceSendEth(payable(forceContractAddress));
        vm.stopPrank();
        console.log("Force contract balance: ", address(force).balance);
    }
}
