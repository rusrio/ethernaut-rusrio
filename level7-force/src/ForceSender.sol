// SPDX License Identifier: MIT 

pragma solidity ^0.8.13;

contract ForceSender {

    function forceSendEth(address payable forceContract) public {
        selfdestruct(forceContract);
    }

    receive() external payable {}

}