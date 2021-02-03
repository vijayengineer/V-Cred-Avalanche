// SPDX-License-Identifier: MIT
pragma solidity ^0.6.8;
import "../contracts/AVAXFlashBorrower.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


// ERC20 Flashloan Example
contract flashLoan is AVAXFlashBorrower{
    // set the Lender contract address to a trusted flashmodule contract
	uint256 public totalfees; // total fees collected till now
    mapping(address => bool) public _whitelist;
    mapping(address => uint256) public balances;

    constructor() public {

    }
    


function withdraw(
    address token,
    address onbehalfOf
  ) public {
        IERC20(token).transfer(onbehalfOf, IERC20(token).balanceOf(address(this)));
  }
}
