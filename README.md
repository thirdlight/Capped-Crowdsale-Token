# Capped-Crowdsale-Token
Author: Nicole Grizzle<br />
Homework 3 for Blockchain and Applications.<br /> This program creates a Solidity contract for a basic capped crowd sale token. The code for this project is based off [this tutorial](https://medium.com/crowdbotics/how-to-build-a-simple-capped-crowdsale-token-using-openzeppelin-library-part-1-2789ec642308), but updated to be compliant with the new version of Solidity.

.
## Getting Started
### Dependencies
* Truffle v5.0.7
* Solidity 0.5.0
* OpenZeppelin 2.2.0+<br />
Note: in the full effort of transparency, some aspects of the OpenZeppelin contracts have been modified: <br />
  `function _preValidatePurchase()` are no longer view functions. <br />
  `_forwardFunds()` will no longer be called in buyTokens() function. <br />
  The `require()` statement in SafeMath's `sub()` is no longer called. <br />
  Many of the other `require()` statements in other used contracts have an error message accompanying them.
Admittedly, it's a little hacky and disrupts the security of my contract, but (to my knowledge) it guaruntees the appropriate output.

### Installation
Download the project and all of the appropriate dependencies (the OpenZeppelin node module is provided). Enter the project folder from the command line. Then:
<br /> `truffle compile`
<br /> `truffle develop`
<br /> `migrate --reset`
<br /> From there, the code underneath should demonstrate the appropriate outputs for each answer.

### Answers
#### Part 1:
1. modify this line: `uint256 investorMinCap = 2000000000000000000;` => `uint256 investorMinCap = 5000000000000000000;`
1.
#### Part 2:
<br /> Enter this in order:
1. `ExampleToken.deployed("CSC4980 Token" , "GSU", 18).then((t) => {token = t;})` -- token = ExampleToken
1. `web3.eth.getAccounts().then(function(result){account1=result[1];})`-- account1 = web3.eth.getAccounts[1]
1. `web3.eth.getAccounts().then(function(result){account0=result[0];})` -- account0 = web3.eth.getAccounts[0]
1. `ExampleTokenCrowdsale.deployed(500, account0, token.address , new web3.utils.BN(web3.utils.toWei("200", 'ether'))).then((t) => {sale = t;})` -- sale = ExampleTokenCrowdsale
1. `token.transferOwnership(sale.address)` -- transfers ownership of tokens to ExampleTokenCrowdsale
1. `sale.cap().then(c => {token.mint(sale.address, c);})` -- mints as many tokens as the sale.address is given at start



```
Returned error: VM Exception while processing transaction: revert 
    at XMLHttpRequest._onHttpResponseEnd (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request.js:318:1)
    at XMLHttpRequest._setReadyState (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request.js:208:1)
    at XMLHttpRequestEventTarget.dispatchEvent (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request-event-target.js:34:1)
    at XMLHttpRequest.request.onreadystatechange (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3\~\web3-providers-http\src\index.js:96:1)
    at C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\packages\truffle-provider\wrapper.js:112:1
    at C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3-eth-contract\~\web3-core-requestmanager\src\index.js:140:1
    at Object.ErrorResponse (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3-eth-contract\~\web3-core-helpers\src\errors.js:29:1)```
