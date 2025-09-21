# Practice 04 (4 hrs): Solidity & ERC-20 Token

In this practice, you are required to learn the solidity language and implement an ERC20 token using sodility.

### Solidity

According to [Wikipedia](https://en.wikipedia.org/wiki/Solidity), Solidity is an object-oriented programming language for implementing smart contracts on various blockchain platforms, most notably, Ethereum. It was developed by Christian Reitwiessner, Alex Beregszaszi, and several former Ethereum core contributors. Programs in Solidity run on Ethereum Virtual Machine.

### ERC-20

According to the introduction from [ERC-20 token standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-20/), the ERC-20 (Ethereum Request for Comments 20), proposed by Fabian Vogelsteller in November 2015, is a Token Standard that implements an API for tokens within Smart Contracts.

Example functionalities ERC-20 provides:

- transfer tokens from one account to another;
- get the current token balance of an account;
- get the total supply of the token available on the network;
- approve whether an amount of token from an account can be spent by a third-party account;

If a Smart Contract implements the following methods and events it can be called an ERC-20 Token Contract and, once deployed, it will be responsible to keep track of the created tokens on Ethereum.

### IERC-20

`IERC20` is an interface contract of the `ERC20` token standard, which specifies the functions and events that the `ERC20` token needs to implement.

According to the answer in [solidity - What is IERC20? - Ethereum Stack Exchange](https://ethereum.stackexchange.com/questions/60940/what-is-ierc20), `ERC20` is an implementation of the Interface defined in `IERC20`. `IERC20` defines function signatures without specifying behavior; the function names, inputs and outputs, but no process. `ERC20` inherits this Interface and is required to implement all the functions described or else the contract will not deploy. If this is deployed, then we can safely say that all the functions described in the ERC20 Interface laid out in `IERC20` have corresponding implementations in `ERC20`.

The `IERC20` interface constract is provided in the file `IERC20.sol`, and its content is as below:

```solidity
pragma solidity ^0.8.4;

/**
 * @dev ERC20 接口合约.
 */
interface IERC20 {
    /**
     * @dev 释放条件：当 `value` 单位的货币从账户 (`from`) 转账到另一账户 (`to`)时.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev 释放条件：当 `value` 单位的货币从账户 (`owner`) 授权给另一账户 (`spender`)时.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev 返回代币总供给.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev 返回账户`account`所持有的代币数.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev 转账 `amount` 单位代币，从调用者账户到另一账户 `to`.
     *
     * 如果成功，返回 `true`.
     *
     * 释放 {Transfer} 事件.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev 返回`owner`账户授权给`spender`账户的额度，默认为0。
     *
     * 当{approve} 或 {transferFrom} 被调用时，`allowance`会改变.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev 调用者账户给`spender`账户授权 `amount`数量代币。
     *
     * 如果成功，返回 `true`.
     *
     * 释放 {Approval} 事件.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev 通过授权机制，从`from`账户向`to`账户转账`amount`数量代币。转账的部分会从调用者的`allowance`中扣除。
     *
     * 如果成功，返回 `true`.
     *
     * 释放 {Transfer} 事件.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}
```

You are required to override every function in IERC20 when implementing your ERC20 token, save the contract as `ERC20.sol` and deploy the contract on [Remix](https://remix.ethereum.org/).

### Requirements

Your program in ERC20.sol does the following:

- Override every function of IERC20 to implement a valid ERC20 token contract.

- Besides, two extra functions should be implemented in your ERC20 token contract, which is show as below:

```solidity
// @dev 在合约部署的时候实现合约名称和符号(需要在部署时输入)
constructor(string memory name_, string memory symbol_);


// @dev 铸造代币，从 address(0) 地址转账给调用者地址
// 如果成功，返回'true'.
// 释放 {Transfer} 事件.
function mint(uint amount) external returns (bool);
```

After testing your contract on the Remix, please show me the screenshots of your results when calling the above functions. For example, when you call `mint`, the result should be like below:

<img src="file:///C:/Users/spongebear/AppData/Roaming/marktext/images/2022-11-11-19-54-31-image.png" title="" alt="" data-align="center">

We can find that a `Transfer` event has been emitted, and the logs show that `0x5B38Da6a701c568545dCfcB03FcB875f56beddC4` has received a transfer from `address(0)`, whose amount is 100. We can also verify this by calling `balanceof`.

![](C:\Users\spongebear\AppData\Roaming\marktext\images\2022-11-11-20-06-47-image.png)

We can find that the balance of `0x5B38Da6a701c568545dCfcB03FcB875f56beddC4` has been 100.
