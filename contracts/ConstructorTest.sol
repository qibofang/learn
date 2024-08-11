// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ConstructorTest {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _; // 表示函数主体
    }

    function changeOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }
    
}