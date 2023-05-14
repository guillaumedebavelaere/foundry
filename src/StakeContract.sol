// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StakeContract {
    error TransferFailed();
    mapping(address user => mapping(address token => uint256 amount))
        public stackedBalances;

    function stake(uint256 amount, address token) external returns (bool) {
        stackedBalances[msg.sender][token] += amount;
        bool success = IERC20(token).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        if (!success) {
            revert TransferFailed();
        }
        return success;
    }
}
