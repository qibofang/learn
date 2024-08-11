// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Receiver {
     uint public number;

    function storeNumber(uint _number) public returns (uint _new_number) {
        require(_number > 0, "_number must be > 0");
        number = _number;
        _new_number = _number + 1;
    }
}