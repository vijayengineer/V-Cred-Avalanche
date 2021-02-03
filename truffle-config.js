const Web3 = require('web3');
module.exports = {
  networks: {
    development: {
      provider: function () {
        return new Web3.providers.HttpProvider("https://api.avax-test.network/ext/bc/C/rpc")//http://localhost:9650/ext/bc/C/rpc
      },
      network_id: "*",
      gas: 3000000,
      gasPrice: 470000000000
    }
  },
  compilers: {
    solc: {
      version: "^0.6.6",
    }
  }
};