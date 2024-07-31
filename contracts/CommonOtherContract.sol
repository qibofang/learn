// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CommonOtherContract {
    uint private _x;
    event TransferLog(uint amount, uint gasleft); // 发送eth的事件

    fallback(bytes calldata value) external payable returns(bytes memory) { }

    receive() external payable { }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    function getX() external view returns(uint) {
        return _x;
    }

    function setX(uint x) external payable {
        _x = x;
        if(msg.value > 0) {
            emit TransferLog(msg.value, gasleft());
        }
    }
}