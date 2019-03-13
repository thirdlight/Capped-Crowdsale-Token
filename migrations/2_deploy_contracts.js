var ExampleToken = artifacts.require("ExampleToken");
var ExampleTokenCrowdsale = artifacts.require("ExampleTokenCrowdsale");
module.exports = function(deployer) {
    deployer.deploy(ExampleToken,"CSC4980 Token" , "GSU", 18).then(function(token) {
        return deployer.deploy(ExampleTokenCrowdsale, 450, ExampleToken.address,ExampleToken.address, new web3.utils.BN(web3.utils.toWei("150", 'ether')))})
};