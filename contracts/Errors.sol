// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Errors {
    error TransferNotOwnerV1();
    error TransferNotOwnerV2(address sender, address tokenOwner);

    mapping(uint256 => address) public _owners;
    
    function transferOwner1(uint256 tokenId, address newOwner) external {
        if (msg.sender != _owners[tokenId]) {
            // revert TransferNotOwnerV1();
            revert TransferNotOwnerV2(msg.sender, _owners[tokenId]);
        }

        _owners[tokenId] = newOwner;
    }

    function transferOwner2(uint256 tokenId, address newOwner) external {
        require(msg.sender == _owners[tokenId], "Transfer not owner");

        _owners[tokenId] = newOwner;
    }

    function transferOwner3(uint256 tokenId, address newOwner) external {
        assert(msg.sender == _owners[tokenId]);

        _owners[tokenId] = newOwner;
    }
}