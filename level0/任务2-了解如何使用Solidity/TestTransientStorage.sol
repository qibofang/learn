// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    constructor(){
    }

    function test() public returns (uint256 v) {
        assembly { // 以太坊中，每个合约都有一个存储空间，可以被划分为多个存储槽位，每个槽位可以存储 32 字节的数据。
            // 使用 assembly 块，调用 tstore 指令将值 321 存储到 SLOT 标识的存储槽位中;使用 assembly 块，调用 tload 指令读取 SLOT 标识的存储槽位中的数据
            // 函数执行完毕后，瞬时存储空间中的数据会被清空。
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        msg.sender.call(b);
        return val();
    }

    function val() public view returns (uint256 v) {
        assembly {
            v := tload(SLOT)
        }
    }
}
