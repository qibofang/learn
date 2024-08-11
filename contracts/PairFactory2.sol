// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./Pair2.sol";

contract PairFactory2 {
    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;

    // 0xbe0eb53f46cd790cd13851d5eff43d12404d33e8    0x2c44b726ADF1963cA47Af88B284C06f30380fC78
    // 提前确定部署地址，并且同样的输入，createPair2只能运行一次
    function createPair2(address inToken0, address inToken1) external returns(address pairAddress) {
        require(inToken0 != inToken1, "IDENTICAL_ADDRESSES");

        (address token0, address token1) = inToken0 < inToken1 ? (inToken0, inToken1) : (inToken1, inToken0);
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));

        Pair2 pair = new Pair2{salt: salt}();
        pair.initialize(inToken0, inToken1);
        pairAddress = address(pair);

        allPairs.push(pairAddress);
        getPair[inToken0][inToken1] = pairAddress;
        getPair[inToken1][inToken0] = pairAddress;
    }

    function calculateAddr(address inToken0, address inToken1) external view returns(address predictedAddress){
        require(inToken0 != inToken1, "IDENTICAL_ADDRESSES");

        (address token0, address token1) = inToken0 < inToken1 ? (inToken0, inToken1) : (inToken1, inToken0);
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));

        bytes memory packedData = abi.encodePacked(
            bytes1(0xff), 
            address(this), 
            salt, 
            keccak256(type(Pair2).creationCode));
        predictedAddress = address(uint160(uint(keccak256(packedData))));
    }
    
}