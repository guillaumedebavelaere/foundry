// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/StakeContract.sol";
import "./mocks/MockERC20.sol";
import "./utils/Cheats.sol";
import "forge-std/StdInvariant.sol";

contract StakeContractTest is StdInvariant, Test {
    Cheats internal constant CHEATS = Cheats(HEVM_ADDRESS);
    StakeContract public stakeContract;
    MockERC20 public mockERC20;

    function setUp() public {
        stakeContract = new StakeContract();
        targetContract(address(stakeContract)); // for invariant testing
        mockERC20 = new MockERC20();
    }

    function testStake(uint8 amount) public {
        mockERC20.approve(address(stakeContract), amount);
        CHEATS.roll(55); // go to block 55
        bool stakePassed = stakeContract.stake(amount, address(mockERC20));
        assertTrue(stakePassed);
    }

    function testDoStuff(uint256 data) public {
        stakeContract.doStuff(data);
        assertEq(stakeContract.shouldAlwaysBeZero(), 0);
    }

    function invariant_testDoStuff() public {
        assertEq(stakeContract.shouldAlwaysBeZero(), 0);
    }
}
