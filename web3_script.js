// web3_script.js
let Web3 = require('web3');
let web3 = new Web3("https://api.avax-test.network/ext/bc/C/rpc");

let main = async () => {
    let accounts = await web3.eth.personal.getAccounts();
    console.log(accounts);
    let account = accounts[0];
    let unlock = await web3.eth.personal.unlockAccount(account);
    console.log(unlock);
}

main()