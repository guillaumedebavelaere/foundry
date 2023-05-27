// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract B {
    uint256 public a;
}

contract T is Test {
    mapping(string => bytes) default_config;
    string config_json;

    uint256 myVar;

    function setUp() public {
        string memory loc = "./config/";
        string memory network = vm.envString("NETWORK");
        string memory path = string.concat(loc, network);
        string memory full_path = string.concat(path, ".json");
        config_json = vm.readFile(full_path);

        myVar = readUintFromDeployConfig("myVar");
    }

    function readDeployConfig(
        string memory key
    ) internal returns (bytes memory) {
        bytes memory val = vm.parseJson(config_json, key);
        return val;
    }

    function readUintFromDeployConfig(
        string memory key
    ) internal returns (uint256) {
        bytes memory val = readDeployConfig(key);
        if (val.length > 0) {
            return abi.decode(val, (uint256));
        } else {
            bytes memory default_conf = default_config[key];
            if (default_conf.length > 0) {
                return abi.decode(default_conf, (uint256));
            } else {
                return 0;
            }
        }
    }
}
