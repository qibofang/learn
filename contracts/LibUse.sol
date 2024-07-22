// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// import "@openzeppelin/contracts/utils/Strings.sol";
// import "@openzeppelin/contracts/utils/Address.sol";
// import "@openzeppelin/contracts/utils/Create2.sol";
// import "@openzeppelin/contracts/utils/Arrays.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

contract LibUse {
    
    function getString(uint256 _number) public pure returns (string memory) {
        return Strings.toHexString(_number);
    }
}