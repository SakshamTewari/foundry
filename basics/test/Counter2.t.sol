// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Counter2} from "../src/Counter2.sol";

contract TestCounter2 is Test {
    Counter2 public counter;

    function setUp() public {
        counter = new Counter2(1);
    }

    function testInc()public {
        counter.increment();
        counter.increment();
        assertEq(counter.num(), uint256(3), "ok");
    }

    //In Foundry, when a test function is prefixed with "testFail", the test is considered successful if it reverts at any point during execution
    function testFailDec() public {
        counter.decrement();
        counter.decrement();
        counter.decrement();
    }
}
