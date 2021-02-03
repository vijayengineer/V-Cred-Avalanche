//let depositPool = artifacts.require('depositPool')
let flashLoan = artifacts.require('flashLoan')
//////let tokenCreator = artifacts.require('tokenCreator');
module.exports = function (deployer) {
    /////deployer.deploy(tokenCreator, '0xc7e5d3ada90205963d6cFb76DAB3C41814343873', 'V-CRED', 'CRED', '1000000000000000000000000')
    deployer.deploy(flashLoan)
    //deployer.deploy(depositPool)
};