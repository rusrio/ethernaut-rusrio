// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Telephone} from "../src/Telephone.sol";
import {AttackRouter} from "../src/AttackRouter.sol";

contract TelephoneTest is Test {

    Telephone public telephone;
    AttackRouter public attackRouter;
    address public alice;
    address public attacker;

    function setUp() public {
        alice = makeAddr("alice");
        attacker = makeAddr("attacker");
        vm.prank(alice);
        telephone = new Telephone();
        attackRouter = new AttackRouter();
    }

    function test_ClaimOwnership() public {
        console.log("Actual owner (Alice): ", telephone.owner());
        console.log("Attacker address: ", address(attacker));
        console.log("---Attacker claiming ownership through router---");
        vm.prank(attacker);
        attackRouter.attack(address(telephone), attacker);
        console.log("Actual owner: ", telephone.owner());
    }

}
