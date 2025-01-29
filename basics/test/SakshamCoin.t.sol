// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/SakshamCoin.sol";

contract TestSakshamCoin is Test {

    SakshamCoin c;

    function setUp() public {
        c = new SakshamCoin();
    }

    function testMint() public {
        c.mint(address(this), 100);
        assertEq(c.balanceOf(address(this)), 100, "ok");
    }
}