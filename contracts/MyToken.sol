// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyToken is IERC20 {
    
    string public constant name = "MyToken";
    string public constant symbol = "MTK";
    uint256 public constant decimals = 18;

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    // 部署时给合约部署的调用方地址mint一些代币
    constructor(uint256 initialSupply) {
        _mint(msg.sender, initialSupply);
    }

    // 铸造代币
    function _mint(address recipient, uint256 amount) internal {
        require(recipient != address(0), "ERC20: mint to the zero address");
        require(amount > 0, "ERC20: mint amount must be greater than 0");

        _totalSupply += amount;
        _balances[recipient] += amount;

        emit Transfer(address(0), recipient, amount);
    }

    // 返回总供应量
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    // 返回某个地址的代币余额
    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }

    // 调用方账户向recipient地址转账
    function transfer(address recipient, uint256 amount) external returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    // 授权调用方账户来实现sender账户向recipient账户转账
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        require(_allowances[sender][msg.sender] >= amount, "ERC20: transfer amount exceeds allowance");

        _approve(sender, msg.sender, _allowances[sender][msg.sender] - amount);
        _transfer(sender, recipient, amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "ERC20: transfer amount must be greater than 0");
        require(_balances[sender] >= amount, "ERC20: transfer amount exceeds balance");

        _balances[sender] -= amount;
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

    // 返回某个地址下对于另外一个地址的代币授权额度
    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowances[owner][spender];
    }

    // 调用方地址授权spender地址多少额度
    function approve(address spender, uint256 amount) external returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        require(amount > 0, "ERC20: approve amount must be greater than 0");

        _allowances[owner][spender] = amount;

        emit Approval(owner, spender, amount);
    }
    
    // 调用方地址销毁多少代币
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
    
    // 授权调用方账户对account地址销毁多少代币
    function burnFrom(address account, uint256 amount) public {
        uint256 decreasedAllowance = _allowances[account][msg.sender] - amount;
        require(decreasedAllowance >= 0, "ERC20: burn amount exceeds allowance");
        
        _approve(account, msg.sender, decreasedAllowance);
        _burn(account, amount);
    }
    
    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");
        require(_balances[account] >= amount, "ERC20: burn amount exceeds balance");
        
        _balances[account] -= amount;
        _totalSupply -= amount;
        emit Transfer(account, address(0), amount);
    }

}