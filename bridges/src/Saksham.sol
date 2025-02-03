// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Saksham is ERC20, Ownable {
    
    constructor() ERC20("Saksham","SAK") {

    }

    function mint(address _to, uint _amount) public isOwner {
        _mint(_to, _amount);
    }

    function burn() public isOwner {
        _burn
    }
}