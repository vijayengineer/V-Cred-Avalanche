// SPDX-License-Identifier: MIT
pragma solidity ^0.6.8;
import "../contracts/AVAXFlashLender.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


// ERC20 Flashloan Example
contract depositPool is AVAXFlashLender{
    // set the Lender contract address to a trusted flashmodule contract
	uint256 public totalfees; // total fees collected till now
    mapping(address => uint256) public balances;

    constructor() public {
      
       // _whitelist[0xF2669dE983b762D000590AED5B9e8920C3BB38aA] = true; // CRED token

      
    }
    
function deposit(
    address token,
    address onbehalfOf,
    uint256 amount
  )  public {
   // require(_whitelist[token], "token not whitelisted");
    IERC20(token).transferFrom(onbehalfOf, address(this), amount);
  
  }
	

function withdraw(
    address token,
    address onbehalfOf
  ) public {
       // require(_whitelist[token], "token not whitelisted");
        IERC20(token).transfer(onbehalfOf, IERC20(token).balanceOf(address(this)));
  }
}
