// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/GatekeeperOne.sol";
import "../src/GatekeeperOneAttack.sol";

contract GatekeeperOneTest is Test {
    GatekeeperOne gatekeeper;
    GatekeeperOneAttack attacker;

    address player = makeAddr("player");

    function setUp() public {
        gatekeeper = new GatekeeperOne();
    }

    function testExploit() public {
        vm.startPrank(player, player);

        console.log("Entrant:", gatekeeper.entrant());
        console.log("Player (tx.origin):", player);
        console.log("--- Player attacking Gatekeeper contract ---");
        attacker = new GatekeeperOneAttack(address(gatekeeper));
        attacker.attack();
        console.log("Entrant:", gatekeeper.entrant());
        console.log("Player (tx.origin):", player);

        assertEq(gatekeeper.entrant(), player, "entrant does not match player");
        
        vm.stopPrank();
    }
}