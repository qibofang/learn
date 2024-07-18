// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Events {
    mapping(address => uint256) public balances;
    event Transfer(address indexed from, address indexed to, uint256 value);

    function _transfer(address _from, address _to, uint256 _value) external {
        balances[_from] = 10000000;
        balances[_from] -= _value;
        balances[_to] += _value;

        emit Transfer(_from, _to, _value);
    }

    
}