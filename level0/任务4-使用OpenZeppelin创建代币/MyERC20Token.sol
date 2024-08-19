// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyERC20Token is IERC20 {
    // 状态变量：代币名称、代币符号、代币最小精度、代币总供应量、每个地址的代币余额、每个地址给与其他地址的代币授权额度
    string public constant name = "MyToken";
    string public constant symbol = "MTK";
    uint256 public constant decimals = 18;
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    // 划转事件和授权事件: 已在IERC20中定义

    // 合约构造函数，用于初始化代币总供应量，并将初始代币分配给合约部署者。
    constructor(uint256 initialSupply) {
        _mint(msg.sender, initialSupply);
    }

    // 用于返回代币总供应量
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    // 用于返回指定地址的代币余额。
    function balanceOf(address account) external view override returns (uint256) {
        return _balances[account];
    }

    // 用于返回指定地址对另一个地址的代币授权额度。
    function allowance(address owner, address spender) external view override returns (uint256) {
        return _allowances[owner][spender];
    }

    // 调用方账户向recipient地址转账
    function transfer(address recipient, uint256 amount) external override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    // 调用方地址授权spender地址多少额度
    function approve(address spender, uint256 amount) external override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    // 授权调用方账户来实现sender账户向recipient账户转账
    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        require(_allowances[sender][msg.sender] >= amount, "transfer amount exceeds allowance");

        _approve(sender, msg.sender, _allowances[sender][msg.sender] - amount);
        _transfer(sender, recipient, amount);
        return true;
    }

    // 内部函数，用于铸造代币，将指定数量的代币分配给指定地址。
    function _mint(address recipient, uint256 amount) internal {
        require(recipient != address(0), "_mint recipient must be not zero address");
        require(amount > 0, "_mint amount must be greater than 0");

        _totalSupply += amount;
        _balances[recipient] += amount;
        emit Transfer(address(0), recipient, amount);
    }

    // 调用方地址销毁多少代币
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // 授权调用方账户对account地址销毁多少代币
    function burnFrom(address account, uint256 amount) public {
        require(_allowances[account][msg.sender] >= amount, "ERC20: burn amount exceeds allowance");

        _approve(account, msg.sender, _allowances[account][msg.sender] - amount);
        _burn(account, amount);
    }

    // 内部函数，用于执行代币转账操作。
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "_transfer sender must be not zero address");
        require(recipient != address(0), "_transfer recipient must be not zero address");
        require(amount > 0, "_transfer amount must be greater than 0");
        require(_balances[sender] >= amount, "_transfer sender balance must be >= amount");

        _balances[sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
    }

    // 内部函数，用于执行代币授权操作。
    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "_approve owner must be not zero address");
        require(spender != address(0), "_approve spender must be not zero address");
        require(amount > 0, "_approve amount must be greater than 0");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    // 内部函数，用于执行代币销毁操作。
    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "_burn account must be not zero address");
        require(amount > 0, "_burn amount must be greater than 0");
        require(_balances[account] >= amount, "_burn account balance must be >= amount");

        _balances[account] -= amount;
        _totalSupply -= amount;
        emit Transfer(account, address(0), amount);
    }
}