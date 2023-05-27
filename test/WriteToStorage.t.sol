// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract B {
	uint256 public a;
}

contract T is Test {
    using stdStorage for StdStorage;
	ERC20 erc20;
	B b;
	function setUp() public {
		erc20 = new ERC20("My token", "MTK");
		b = new B();
	}

	function test_writeBalance() public {
		// set my token balance to 10e18, and update totalSupply
		deal(address(erc20), address(this), 10e18, true);
	}

	function test_writeArbitrary() public {
		// write to storage (in contract B, in a variable, though there is no setter)
		stdstore.target(address(b))
			.sig(b.a.selector)
			.checked_write(100);
		assertEq(b.a(), 100);
	}
}