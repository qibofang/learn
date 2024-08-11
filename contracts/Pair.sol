// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Pair {
    address public factory;
    address public token0;
    address public token1;

    constructor() payable {
        factory = msg.sender;
    }

    function initialize(address inToken0, address inToken1) external {
        require(msg.sender == factory, "UniswapV2: FORBINDDEN");
        token0 = inToken0;
        token1 = inToken1;
    }
    
}