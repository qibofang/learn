// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ValueTypes {
    bool public _bool = true;
    bool public _bool1 = !_bool;

    int public _int = 1;
    uint public _number = 1;
    uint public _number1 = _number + 1;

    address public _address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable public _address1 = payable(_address); // 显式类型转换
    uint public balance = _address.balance; // uint256: 99999999999998499008
    uint public balance1 = _address1.balance;

    bytes32 public _bytes32 = "MiniSolidity"; // bytes32: 0x4d696e69536f6c69646974790000000000000000000000000000000000000000
    bytes1 public _byte = _bytes32[0]; // bytes1: 0x4d

    enum ActionSet {Buy, Hold, Sell}
    ActionSet action = ActionSet.Buy;

    // Function to convert uint to ActionSet
    function uintToEnum() external view returns(ActionSet) {
        require(_number <= uint(ActionSet.Sell), "Invalid action");
        return ActionSet(_number); // uint8: 1
    }

    // Function to convert ActionSet to uint
    function enumToUint() external view returns(uint) {
        return uint(action); // uint256: 0
    }
}