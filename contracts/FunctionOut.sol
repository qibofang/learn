// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FunctionOut {
    uint public numberValue;
    bool public boolValue;
    uint[3] public arrayValue;

    constructor() {
        (, boolValue, ) = returnNamed();
    }


    function returnMuitiple() public pure returns (uint, bool, uint[3] memory) {
        return (1, true, [uint(1), 2, 3]);
    }

    function returnNamed() public pure returns (uint _num, bool _bool, uint[3] memory _array) {
        _num = 1;
        _bool = true;
        _array = [uint(1), 2, 3];
    }    
}