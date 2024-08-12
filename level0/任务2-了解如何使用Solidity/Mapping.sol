// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Mapping {
    mapping(address => uint256) public myMap;

    constructor(){
    }

    function get(address addr) public view returns(uint256) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return myMap[addr];
    }

    function set(address addr, uint256 i) public {
        // Update the value at this address
        myMap[addr] = i;
    }

    function remove(address addr) public {
        // Reset the value to the default value.
        delete myMap[addr];
    }
}
