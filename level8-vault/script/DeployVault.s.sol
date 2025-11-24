// SPDX License Identifier: MIT

pragma solidity ^0.8.13;

import {Script} from "../lib/forge-std/src/Script.sol";
import {Vault} from "../src/Vault.sol";

contract DeployVault is Script {
    Vault public vault;
    function run() external {
        bytes32 password = vm.parseBytes32("0x1234000000000000000000000000000000000000000000000000000000000000");
        vm.startBroadcast();
        vault = new Vault(password);
        vm.stopBroadcast();
    }
}