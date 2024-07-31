// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./Pair.sol";

contract PairFactory {
    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;

    // 0xbe0eb53f46cd790cd13851d5eff43d12404d33e8    0x2c44b726ADF1963cA47Af88B284C06f30380fC78
    // 输入相同但是每次生成的部署地址都不一样
    function createPair(address inToken0, address inToken1) external returns(address pairAddress) {
        Pair pair = new Pair();
        pair.initialize(inToken0, inToken1);
        pairAddress = address(pair);

        allPairs.push(pairAddress);
        getPair[inToken0][inToken1] = pairAddress;
        getPair[inToken1][inToken0] = pairAddress;
    }
    
}