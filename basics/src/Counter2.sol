// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Counter2 {
    uint public num;

    constructor (uint _num) {
        num = _num;
    }

    function increment() public {
        num++;
    }

    function decrement() public {
        num--;
    }
}