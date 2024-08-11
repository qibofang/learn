// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./Base1.sol";

contract Indentifier is Base1 {
    modifier exactDividedBy2And3(uint a) override {
        require(a % 1 == 0);
        _; // _ 代表修饰的函数体将被插入的位置。当修饰符被应用到一个函数上时，函数体的代码将替换修饰符中的 _。这允许修饰符在执行函数体之前或之后执行额外的代码
    }

    function getExactDividedBy2And3(uint dividend) public exactDividedBy2And3(dividend) pure returns (uint, uint) {
        return getExactDividedBy2And3WithoutModifier(dividend);
    }

    function getExactDividedBy2And3WithoutModifier(uint dividend) public pure returns (uint, uint) {
        return (dividend / 2, dividend / 3);
    }
}