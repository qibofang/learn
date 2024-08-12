// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CalleeV2 {
    event FunctionCalled(string);

    constructor(){
    }

    function foo() external payable {
        emit FunctionCalled("this is foo");
    }

    // 你可以注释掉 receive 函数来模拟它没有被定义的情况
    receive() external payable {
        emit FunctionCalled("this is receive");
    }

    // 你可以注释掉 fallback 函数来模拟它没有被定义的情况
    fallback() external payable {
        emit FunctionCalled("this is fallback");
    }
}
