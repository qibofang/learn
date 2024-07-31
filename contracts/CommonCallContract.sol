// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// import "./DirectOtherContract.sol";

contract CommonCallContract {
    event Response(bool success, bytes data);
    
    function callSetX(address payable contractAddress, uint x) external payable {
        (bool success, bytes memory data) = contractAddress.call{value: msg.value/3}(abi.encodeWithSignature("setX(uint256)", x));

        emit Response(success, data);
    }

    function callNonExist(address contractAddress) external {
        (bool success, bytes memory data) = contractAddress.call(abi.encodeWithSignature("setXNonExist(uint256)"));

        emit Response(success, data);
    }
}