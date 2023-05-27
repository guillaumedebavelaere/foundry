// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {StakeContract} from "../src/StakeContract.sol";

contract StakeContractScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new StakeContract();
    }

    function run2() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.rememberKey(privateKey);
        vm.broadcast(deployer);
        new StakeContract();
    }
}
