// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract AbiEncode {

    uint x = 10;
    address addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    string name = "0xAA";
    uint[2] array = [5, 6];

    event Response(bool success, bytes data);

    function encode() public view returns (bytes memory _result) {
        _result = abi.encode(x, addr, name, array);
    }

    function encodePacked() public view returns (bytes memory _result) {
        _result = abi.encodePacked(x, addr, name, array);
    }

    function encodeWithSignature() public view returns (bytes memory _result) {
        _result = abi.encodeWithSignature("foo(uint256,address,string,uint256[2])", x, addr, name, array);
    }

    function encodeWithSelector() public view returns (bytes memory _result) {
        _result = abi.encodeWithSelector(bytes4(keccak256("foo(uint256,address,string,uint256[2])")), x, addr, name, array);
    }

    function decode(bytes memory _data) public pure returns (uint _x, address _addr, string memory _name, uint[2] memory _array) {
        (_x, _addr, _name, _array) = abi.decode(_data, (uint, address, string, uint[2]));
    }

    // Receiver部署到链上后，进行call调用
    function callStoreNumber(address _contract, uint _num) public {
        bytes memory callData = abi.encodeWithSelector(bytes4(keccak256("storeNumber(uint256)")), _num);
        (bool success, bytes memory returnData) = _contract.call(callData);
        emit Response(success, returnData);
    }
}