// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

abstract contract AbstractInsertSort {
    function insertSort(uint[] memory _arr) public pure virtual returns (uint[] memory);
}