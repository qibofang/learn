// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./OnlyEven.sol";

contract TryCatch {
    event SuccessEvent();
    event CatchEvent(string message);
    event CatchPanic(uint data);
    event CatchByte(bytes data);

    OnlyEven even;

    constructor() {
        even = new OnlyEven(2);
    }

    function execute(uint _amount) external returns (bool _success) { // 0、1
        try even.onlyEven(_amount) returns (bool _inner_success) {
            emit SuccessEvent();
            return _inner_success;
        } catch Error(string memory _reason) {
            emit CatchEvent(_reason);
        }
    }

    function executeNew(uint _amount) external returns (bool _success) { // 0、
        try new OnlyEven(_amount) returns (OnlyEven _even) {
            emit SuccessEvent();
            return _even.onlyEven(_amount);
        } catch Error(string memory _reason) {
            emit CatchEvent(_reason);
        } catch Panic(uint _reason) {
            emit CatchPanic(_reason);
        } catch (bytes memory _reason) {
            emit CatchByte(_reason);
        }
    }
}