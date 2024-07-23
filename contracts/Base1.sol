// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Base1 {
    modifier exactDividedBy2And3(uint a) virtual {
        require(a % 2 == 0 && a % 3 == 0);
        _;
    }
}