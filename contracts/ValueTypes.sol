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
    ActionSet public action = ActionSet.Buy;

    // Function to convert uint to ActionSet
    function uintToEnum() external view returns(ActionSet) {
        require(_number <= uint(ActionSet.Sell), "Invalid action");
        return ActionSet(_number); // uint8: 1
    }

    // Function to convert ActionSet to uint
    function enumToUint() external view returns(uint) {
        return uint(action); // uint256: 0
    }

    uint[3] public fixedArray = [uint(1), 2, 3]; // 数组字面量。每一个元素类型以第一个元素为准，若都没有指定类型则默认会指定最小单位的类型
    uint[] public storageArray;

    function setStorageArray() public {
        storageArray = fixedArray;
        // 添加一些元素到存储数组
        storageArray.push(1);
        storageArray.push(2);
        storageArray.push(3);
        storageArray.push(4);
        storageArray.push(5);
    }

    function copyToMemoryArray() public view returns (uint[] memory) {
        uint[] memory memoryArray = new uint[](fixedArray.length);
        // memoryArray = fixedArray; // TypeError: Type uint256［3］ storage ref is not imp licitly convertible to expected type uint256［］ memory
        for (uint i = 0; i < fixedArray.length; i++) { // 通过对fixedArray或者storageArray进行一一赋值
            memoryArray[i] = fixedArray[i];
        }
        // memoryArray.push(5); // TypeError: Member "push" is not available in uint256［］ memory outside of storage
        return memoryArray;
    }

    struct Student {
        uint id;
        uint score;
    }

    Student public student;

    function initStudent1() external {
        Student storage _student = student;
        _student.id = 1;
        _student.score = 10;
    }

    function initStudent2() external {
        student.id = 2;
        student.score = 20;
    }

    function initStudent3() external {
        student = Student(3, 30);
    }

    function imitStudent4() external {
        student = Student({id: 4, score: 40});
    }
    
    mapping(address => address) public testVar;
    mapping(uint => address) public testVar1;

    function testMapping() external {
        testVar1[0] = address(this); // 当前合约实例的地址
        testVar1[1] = msg.sender; // 当前函数调用的直接发起者，比如外部账户
    }

    function getMappingVal(uint num) external view returns (address) {
        return testVar1[num];
    }
}