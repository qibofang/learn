// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OnlyEven {
    constructor(uint _a) {
        require(_a != 0, "invalid number");
        assert(_a != 1);
    }

    function onlyEven(uint _b) external pure returns (bool _success) {
        require(_b % 2 == 0, "Ups! Reverting");
        _success = true;
    }
    
}