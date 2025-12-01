# Ethernaut Solutions
## This repository contains solutions for the OpenZeppelin Ethernaut game, implemented entirely using Foundry.

Each level is solved within a dedicated test file. This approach allows for local simulation of the exploit logic against a local anvil instance.

## Methodology
The solving process treats each challenge as a protocol integration test. The exploit logic is written in Solidity, leveraging Foundry's cheatcodes (vm.prank, vm.deal, etc.) to simulate the attacker's actions.
Inside every level's file, you will find the standard Foundry project structure, in the test file ``ExampleLevel.t.sol`` there will be the simulation of the attack, meanwhile a explanation of the vulnerability will be written in the ``README.md``.
