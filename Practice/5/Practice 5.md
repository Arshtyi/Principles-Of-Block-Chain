# Practice 05(4 hrs): Airdrop

In this practice, you are required to implement an airdrop contract to distribute `ERC20` tokens to specific users.

### What is airdrop?

Airdrop is a marketing strategy in the crypto-currency community, and the project manager distributes tokens to specific user groups for free. In order to qualify for airdrop, users usually need to complete some simple tasks, such as testing products, sharing news, introducing the project to friends, etc. Projects can get seed users through airdrops, and users can get a fortune, which is the best of both worlds.

Because there are many users who receive airdrops each time, it is impossible for the project manager to transfer money one by one. Using smart contracts to distribute `ERC20` tokens in batches can significantly improve the efficiency of airdrops. 

### Requirements

Your program in `airdrop.sol` does the following:

- The logic of an airdrop contract is very simple, that is, the contract sends `ERC20` tokens to multiple addresses using loops.

- The contract should contain two functions:

```solidity
pragma solidity ^0.8.4;

import "./IERC20.sol"; //import IERC20

/// @notice 向多个地址转账ERC20代币
contract Airdrop {
    /// @notice 向多个地址转账ERC20代币，使用前需要先授权
    ///
    /// @param _token 转账的ERC20代币地址
    /// @param _addresses 空投地址数组
    /// @param _amounts 代币数量数组（每个地址的空投数量）
    function multiTransferToken(
        address _token,
        address[] calldata _addresses,
        uint256[] calldata _amounts
        ) external {
        // 声明IERC合约变量
        // 传入ERC20合约地址之后生成的token可视为一个ERC20代币，可直接调用合约函数
        IERC20 token = IERC20(_token); 

        // 请完成该函数剩余部分
    }

    // 数组求和函数
    function getSum(uint256[] calldata _arr) public pure returns(uint sum)
    {
        // 请实现数组求和并返回求和结果
    }
}
```

Below is a function to transfer ETH to multi addresses, which may provide some instructions if you have no idea about how to implement the function `multiTransferToken`.

```solidity
/// 向多个地址转账ETH
function multiTransferETH(
    address payable[] calldata _addresses,
    uint256[] calldata _amounts
) public payable {
    // 检查：_addresses和_amounts数组的长度相等
    require(_addresses.length == _amounts.length, "Lengths of Addresses and Amounts NOT EQUAL");
    uint _amountSum = getSum(_amounts); // 计算空投ETH总量
    // 检查转入ETH等于空投总量
    require(msg.value == _amountSum, "Transfer amount error");
    // for循环，利用transfer函数发送ETH
    for (uint256 i = 0; i < _addresses.length; i++) {
        _addresses[i].transfer(_amounts[i]);
    }
}
```

### Outputs

Please show me the screenshots of your results after calling the function `multiTransferToken`. 

Before that, you need to deploy the `ERC20` contract, which has been completed in Practice 4, and `mint` 10000 tokens for the owner of the contract. Then you should deploy the Airdrop contract and `approve` 10000 `ERC20` tokens for it.

After that, you can call `multiTransferToken` to transfer tokens to certain addresses.

Please inquire balances of these addresses using the function `balanceOf` to verify that the transferences have been completed successfully.
