// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20MinerReward is ERC20 {
    event LogNewAlert(string description, address indexed from, uint256 n);

    constructor() ERC20("MinerReward", "MRW") {}

    // 将 20 个代币奖励给当前区块的矿工地址 block.coinbase
    function _reward() public {
        _mint(block.coinbase, 20);
        emit LogNewAlert("_rewarded", block.coinbase, block.number);
    }
}
