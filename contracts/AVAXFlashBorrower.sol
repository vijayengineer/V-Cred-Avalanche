// SPDX-License-Identifier: MIT
pragma solidity ^0.6.8;
pragma experimental ABIEncoderV2;

import "./AVAXFlashLender.sol";
import "../contracts/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


// @notice Used by borrower to flash-borrow ERC20 tokens from ERC20FlashLender
// @dev Example contract. Do not use. Has not been audited.
contract AVAXFlashBorrower is Ownable {
    using SafeMath for uint256;
    uint256 arbVal;

    // set the Lender contract address to a trusted ERC20FlashLender
    AVAXFlashLender public constant avaxFlashLender = AVAXFlashLender(address(0xa1Ba1E7dD7AD2C72A25650ceECaa617319D5Cffb));
    uint256 constant internal ONE = 1e18;

    
    // @notice Borrow any ERC20 token that the ERC20FlashLender holds
    function borrow(address token, uint256 amount) public onlyOwner {    
       avaxFlashLender.AVAXFlashLoan(token, amount);
    }


    // this is called by ERC20FlashLender after borrower has received the tokens
    // every ERC20FlashBorrower must implement an `executeOnERC20FlashLoan()` function.
    function executeOnAVAXFlashLoan(address token, uint256 amount, uint256 debt) external {
        require(msg.sender == address(avaxFlashLender), "only lender contract can execute");

        //... do whatever you want with the tokens to generate profit
        //assuming BTC as the entry point *BAND_ORACLE.getPrice("ETH","SXP")*BAND_ORACLE.getPrice("SXP","BTC")
     
        
       
        //since we are on a testnet with no liquidity the liquidity from lender is used for test purposes
        //frontend will show a demo of the arbitrage value
        
        
        // authorize loan repayment
        IERC20(token).approve(address(avaxFlashLender), debt);
    }
}
