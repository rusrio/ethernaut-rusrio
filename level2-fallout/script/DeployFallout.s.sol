// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Fallout} from "../src/Fallout.sol";

contract FalloutScript is Script {
    Fallout public fallout;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        fallout = new Fallout();

        vm.stopBroadcast();
    }
}
