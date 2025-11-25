// SPDX License Identifier: MIT

pragma solidity ^0.8.13;

contract Building {

    bool top = true;

    function isLastFloor(uint256 floor) external returns (bool) {
        top = !top;
        return top;
    }

}