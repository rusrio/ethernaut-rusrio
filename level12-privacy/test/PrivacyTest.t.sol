// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Privacy} from "../src/Privacy.sol";

contract PrivacytTest is Test {
    Privacy public privacy;

    function setUp() public {
        bytes32 data1 = vm.parseBytes32("0x1234000000000000000000000000000000000000000000000000000000000000");
        bytes32 data2 = vm.parseBytes32("0x5678000000000000000000000000000000000000000000000000000000000000");
        bytes32 data3 = vm.parseBytes32("0x9012000000000000000000000000000000000000000000000000000000000000");
        bytes32[3] memory dataArray = [data1, data2, data3];
        privacy = new Privacy(dataArray);
    }

    function test_Privacy() public {
        bytes32 data = vm.parseBytes32("0x1234000000000000000000000000000000000000000000000000000000000000");
        bytes16 parsedData = bytes16(data);
        bytes16 pwn = bytes16(vm.load(address(privacy), bytes32(uint256(5))));
        privacy.unlock(pwn);
        console.log(privacy.locked());
        console.logBytes16(pwn);
        console.logBytes32(data);
        console.logBytes16(parsedData);
    }
}
