// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./DirectOtherContract.sol";

contract DirectCallContract {
    function callSetX(address payable contractAddress, uint x) external {
        // 传入合约地址
        DirectOtherContract(contractAddress).setX(x);
    }

    function callGetX(DirectOtherContract otherContract) external view returns(uint) {
        // 传入合约变量
        return otherContract.getX();
    }

    function setXTransferETH(address payable contractAddress, uint x) external payable  {
        // 调用合约并发送eth
        // DirectOtherContract(contractAddress).setX{value: msg.value}(x);
        DirectOtherContract(contractAddress).setX{value: msg.value / 3}(x); // 存在两笔eth交易：外部账户 -> DirectCallContract; DirectCallContract 合约 -> DirectOtherContract 合约
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}