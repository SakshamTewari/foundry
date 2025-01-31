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

    function testTreansfer() public{
        c.mint(address(this), 100);
        c.transfer(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 100);

        assertEq(c.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4), 100, "ok");

        // vm.prank (to change msg.sender while test)
        vm.prank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        c.transfer(address(this), 100);

        assertEq(c.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4), 0, "ok");
        assertEq(c.balanceOf(address(this)), 100,"ok");

    }

    function testApprove() public {
        c.mint(address(this), 100);
        c.approve(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10);

        assertEq(c.allowance(address(this),0x5B38Da6a701c568545dCfcB03FcB875f56beddC4), 10 );

        vm.prank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        c.transferFrom(address(this),0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 5);

        assertEq(c.balanceOf(address(this)), 95, "ok");
        assertEq(c.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4), 5, "ok");
        assertEq(c.allowance(address(this),0x5B38Da6a701c568545dCfcB03FcB875f56beddC4), 5 );
    }
}