pragma solidity ^0.6.6;

interface IAVAXFlashBorrower {
    function executeOnAVAXFlashLoan(address token, uint256 amount, uint256 debt) external;
}