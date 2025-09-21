// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    string public name;
    string public symbol;
    uint8 public constant decimals = 18;
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    constructor(string memory name_, string memory symbol_) {
        name = name_;
        symbol = symbol_;
    }
    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) external view override returns (uint256) {
        return _balances[account];
    }
    function transfer(address to, uint256 amount) external override returns (bool) {
        address owner = msg.sender;
        require(to != address(0), "ERC20: transfer to the zero address");
        require(_balances[owner] >= amount, "ERC20: transfer amount exceeds balance");
        _balances[owner] -= amount;
        _balances[to] += amount;
        emit Transfer(owner, to, amount);
        return true;
    }
    function allowance(address owner, address spender) external view override returns (uint256) {
        return _allowances[owner][spender];
    }
    function approve(address spender, uint256 amount) external override returns (bool) {
        address owner = msg.sender;
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
        return true;
    }
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external override returns (bool) {
        address spender = msg.sender;
        require(to != address(0), "ERC20: transfer to the zero address");
        require(_balances[from] >= amount, "ERC20: transfer amount exceeds balance");
        require(_allowances[from][spender] >= amount, "ERC20: transfer amount exceeds allowance");
        _balances[from] -= amount;
        _balances[to] += amount;
        _allowances[from][spender] -= amount;
        emit Transfer(from, to, amount);
        return true;
    }
    function mint(uint amount) external returns (bool) {
        address to = msg.sender;
        require(to != address(0), "ERC20: mint to the zero address");
        _totalSupply += amount;
        _balances[to] += amount;
        emit Transfer(address(0), to, amount);
        return true;
    }
    function burn(uint amount) external returns (bool) {
        address from = msg.sender;
        require(_balances[from] >= amount, "ERC20: burn amount exceeds balance");
        _balances[from] -= amount;
        _totalSupply -= amount;
        emit Transfer(from, address(0), amount);
        return true;
    }
}
