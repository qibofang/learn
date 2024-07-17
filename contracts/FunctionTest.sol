// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FunctionTest {
    uint public number = 5;

    function add() external {
        number += 1;
    }

    // test pure and view
    function addPure(uint _number) external pure returns (uint _new_number) {
        _new_number = _number + 1;
    }
    
    function addView() external view returns (uint _new_number) {
        _new_number = number + 1;
    }

    // test internal and external
    function minus() internal { // 不会在remix页面中展示进而被调用
        number -= 1;
    }

    function minusCall() external  {
        minus();
    }

    // test payable
    function minusPayable() external payable returns (uint _balance) { // 不会在remix页面中展示，但是会在控制台窗口中显示日志信息
        minus();
        _balance = address(this).balance;
    }
}