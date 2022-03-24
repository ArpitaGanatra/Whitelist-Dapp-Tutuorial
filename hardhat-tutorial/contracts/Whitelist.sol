// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // max number of addresses that are allowed to be whitelisted
    uint8 public maxWhitelistedAddresses;

    // number of addresses already whitelisted
    uint8 public numAddressesWhitelisted;

    // mapping of all the addresses and if they are whitelisted or not
    mapping (address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhiteList() public {
        require(!whitelistedAddresses[msg.sender], "Sender already in the whitelist");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max Limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}