// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/SakshamCoin.sol";

contract TestSakshamCoin is Test {

    SakshamCoin c;

    // event
    event Transfer(address indexed from, address indexed to, uint value);

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
        // vm.prank is a shorthand function that allows us to impersonate an address for just one transaction
        // 'vm.srartPrank' changes the msg.sender for all subsequent transactions
        vm.prank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        c.transfer(address(this), 100);

        assertEq(c.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4), 0, "ok");
        assertEq(c.balanceOf(address(this)), 100,"ok");

        // testing vm.startPrank;
        c.transfer(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 100);
        vm.startPrank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        c.transfer(address(this), 20);
        c.transfer(address(this), 20);
        c.transfer(address(this), 20);
        c.transfer(address(this), 20);
        c.transfer(address(this), 20);
        vm.stopPrank();

        assertEq(c.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4), 0, "ok");

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

    // 'testFail' 

    function testFailApprovals() public {
        c.mint(address(this), 100);
        c.approve(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10);

        vm.prank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        c.transferFrom(address(this), 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 20);
    }

    function testFailTransfer() public {
        c.mint(address(this), 20);
        c.transfer(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 100);
    }

    // Test 'emits'

    function testTransferEmit() public {
        c.mint(address(this), 100);

        // what values we want to compare with the emitted event? 
        // we can have maximum of 3 indexed topics , and rest is data
        // so address from (indexed) = true , address to (indexed) = true, 3rd index (not present) = false, uint data = true 
        vm.expectEmit(true, true, false, true);

        // what we expect now
        emit Transfer(address(this), 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10 );

        c.transfer(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10);
    }

    // 'hoax'

    function testDealExample() public {
        hoax(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 100 ether);
        c.test{value : 100 ether}();
        assertEq(c.balance(), 100 ether, "ok");
    }
    
 
}