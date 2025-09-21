// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IERC20.sol"; // import IERC20

/// @notice 向多个地址转账ERC20代币
contract Airdrop {
    /// @notice 向多个地址转账ERC20代币，使用前需要先授权
    /// @param _token 转账的ERC20代币地址
    /// @param _addresses 空投地址数组
    /// @param _amounts 代币数量数组（每个地址的空投数量）
    function multiTransferToken(
        address _token,
        address[] calldata _addresses,
        uint256[] calldata _amounts
    ) external {
        // 声明IERC20合约变量
        IERC20 token = IERC20(_token);

        // 检查：_addresses和_amounts数组的长度相等
        require(
            _addresses.length == _amounts.length,
            "Lengths of Addresses and Amounts NOT EQUAL"
        );

        // 计算空投代币总量，并检查授权是否足够
        uint256 amountSum = getSum(_amounts);
        require(
            token.allowance(msg.sender, address(this)) >= amountSum,
            "Insufficient allowance"
        );

        // 循环调用transferFrom从调用者转账到每个地址
        for (uint256 i = 0; i < _addresses.length; i++) {
            require(_addresses[i] != address(0), "Invalid address");
            require(_amounts[i] > 0, "Zero amount");
            bool ok = token.transferFrom(
                msg.sender,
                _addresses[i],
                _amounts[i]
            );
            require(ok, "transferFrom failed");
        }
    }

    /// @notice 数组求和函数
    /// @param _arr 待求和的uint256数组
    /// @return sum 数组元素之和
    function getSum(uint256[] calldata _arr) public pure returns (uint256 sum) {
        for (uint256 i = 0; i < _arr.length; i++) {
            sum += _arr[i];
        }
    }
}
