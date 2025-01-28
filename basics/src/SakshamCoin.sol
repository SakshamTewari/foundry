// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract SakshamCoin {

    uint public totalSupply;
    address public owner;
    constructor() {
        owner = msg.sender;
    }

    function mint(uint _amount) public {
        require(msg.sender == owner, "only owner can mint");
        totalSupply += _amount;
    }

}