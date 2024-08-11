// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract UintOverLoading {
    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }

    function select() public pure returns (uint256 out) {
        return f(uint(8)); // f(8)编译的时候就会显示有问题
    }
}