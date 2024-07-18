// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract InsertSort {

    function insertSort(uint[] memory _arr) external pure returns (uint[] memory) {
        if (_arr.length <= 1) {
            return _arr;
        }

        for (uint i = 1; i < _arr.length; ++i) {
            uint tmp = _arr[i];
            uint j = i;
            while (j >= 1 && _arr[j - 1] > tmp) {
                _arr[j] = _arr[j - 1];
                j--;
            }
            _arr[j] = tmp;
        }
        return _arr;
    }
    
}