import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract BridgeETH is Ownable{
    uint public balance;
    address public tokenAddress;

    // To trigger the 'Node.js' process to communicate with the other chain
    event Deposit(address indexed depositor, uint amount);

    mapping(address => uint) public pendingBalance;
    constructor(address _tokenAddress) Ownable(msg.sender){
        tokenAddress = _tokenAddress;
    }

    function deposit(IERC20 _tokenAddress, uint _amount) public {

        emit Deposit(msg.sender, _amount);
    }

    function withdraw(IERC20 _tokenAddress, uint _amount) public {
        pendingBalance[msg.sender] -= _amount;
    }

    function burnedOnOtherChain(address userAccount, uint _amount) public onlyOwner {
        // as user deposits/burn WSaksham on other chain, we increase the balance here
        pendingBalance[userAccount] += _amount;
    }
}