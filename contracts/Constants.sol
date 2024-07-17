// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Constants {
    string public constant CONSTANT_NUM = "0xaa";
    address public constant CONSTANT_ADDRESS = address(0);

    uint256 public immutable IMMUTABLE_NUM = 100;
    address public immutable IMMUTABLE_CONTRACT_ADDRESS;
    address public immutable IMMUTABLE_EOA_ADDRESS;
    uint256 public immutable IMMUTABLE_TEST;

    constructor() {
        IMMUTABLE_CONTRACT_ADDRESS = address(this); // 当前合约的地址
        IMMUTABLE_EOA_ADDRESS = msg.sender; // 调用合约的外部账户（也称为交易发送者或 msg.sender）的地址
        IMMUTABLE_TEST = 1;
    }

    function test() public pure returns (uint256) {
        uint256 what = 9;
        return what;
    }

    // function test1() public {
    //     CONSTANT_NUM = "aaaa";
    // }


}
