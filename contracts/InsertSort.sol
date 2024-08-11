// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
// import './AbstractInsertSort.sol';
import {AbstractInsertSort} from './AbstractInsertSort.sol';


contract InsertSort is AbstractInsertSort {
    string public logName = 'InsertSort';

    function insertSort(uint[] memory _arr) public pure override returns (uint[] memory) {
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