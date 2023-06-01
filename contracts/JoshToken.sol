// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Interface for Erc20 token standard
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Introduces authorization access
import "@openzeppelin/contracts/access/Ownable.sol";

contract JoshToken is ERC20, Ownable {
    uint256 _totalSupply = 0;

    mapping(address => uint256) public balance; // Mapping to track the balanceOf of token holders

    constructor() ERC20("JoshToken", "JSH") {}

    /**
     * Mint JSH token
     * @param amount Amount to mint
     */
    function mintToken(uint amount) public onlyOwner {
        balance[msg.sender] += amount;
        _totalSupply += amount;
    }

    /**
     * Transfer token to an account
     * @param recipient Receiver's address
     * @param amount Amount to be sent
     */
    function transfer(
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        require(
            recipient != address(0),
            "JSH: Can't transfer to a zero address"
        );
        require(
            balance[msg.sender] >= amount,
            "JSH: transfer amount exceeds balance"
        );

        balance[msg.sender] -= amount;
        balance[recipient] += amount;
        return true;
    }

    /**
     * Burn some token
     * @param amount Amount to burn
     */
    function burn(uint amount) public {
        require(
            balance[msg.sender] >= amount,
            "JSH: burn amount exceeds balance"
        );
        balance[msg.sender] -= amount;
        _totalSupply -= amount;
    }

    function getTotalSupply() public view returns (uint) {
        return _totalSupply;
    }

    function getMyBalance() public view returns (uint) {
        return balance[msg.sender];
    }
}
