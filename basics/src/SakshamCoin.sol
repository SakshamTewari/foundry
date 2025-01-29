// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { console } from "forge-std/console.sol";

contract SakshamCoin is ERC20{

    address public owner;
    constructor() ERC20("Saksham","Saky"){
        owner = msg.sender;
    }

    function mint(address to, uint _amount) public {
        // require(msg.sender == owner, "only owner can mint");
        _mint(to, _amount);
    }

}