# Capped-Crowdsale-Token
Author: Nicole Grizzle <br />
Homework 3 for Blockchain and Applications.
This program creates a Solidity contract for a basic capped crowd sale token. The code for this project is based off [this tutorial](https://medium.com/crowdbotics/how-to-build-a-simple-capped-crowdsale-token-using-openzeppelin-library-part-1-2789ec642308), but updated to be compliant with the new version of Solidity.
<br />
## Getting Started
### Dependencies
* Truffle v5.0.7
* Solidity 0.5.0
* OpenZeppelin 2.1.3+<br /><br />
Note: in the full effort of transparency, some aspects of the OpenZeppelin contracts have been modified: <br />
*  function `preValidatePurchase()` are no longer view functions. 
*  `_forwardFunds()` will no longer be called in `buyTokens()` function. 
*  The `require()` statement in SafeMath's `sub()` is no longer called. 
* Many of the other `require()` statements in other used contracts have an error message accompanying them. <br />
Admittedly, it's a little hacky and disrupts the security of my contract, but (to my knowledge) it guaruntees the appropriate output.
### Installation
Download the project and all of the appropriate dependencies (the OpenZeppelin node module is provided). Enter the project folder from the command line. Then: 
* `truffle compile` 
* `truffle develop` 
* `migrate --reset` <br />
From there, the code underneath should demonstrate the appropriate outputs for each answer.

### Answers
#### Part 1:
1. Modified this line: `uint256 investorMinCap = 2000000000000000000` => `uint256 investorMinCap = 5000000000000000000`
1. Created `uint256 tokensLeft`, which is set in the constructor `(tokensLeft = _cap * _rate)` and appropriately subtracted after each transaction `(tokensLeft = tokensLeft.sub(_weiAmount.mul(this.rate())))`. The function `getTokensLeft()` return tokensLeft;
1. Added the require statement in `_preValidatePurchase()`: `require(_existingContribution == 0, "already invested in the crowdsale")`
#### Part 2:

Enter this in order:

1. `ExampleToken.deployed("CSC4980 Token" , "GSU", 18).then((t) => {token = t;})` -- token = ExampleToken
1. `web3.eth.getAccounts().then(function(result){account1=result[1];})` -- account1 = web3.eth.getAccounts[1]
1. `web3.eth.getAccounts().then(function(result){account0=result[0];})` -- account0 = web3.eth.getAccounts[0]
1. `ExampleTokenCrowdsale.deployed(450, account0, token.address , new web3.utils.BN(web3.utils.toWei("150", 'ether'))).then((t) => {sale = t;})` -- sale = ExampleTokenCrowdsale
1. `token.transferOwnership(sale.address)` -- transfers ownership of tokens to ExampleTokenCrowdsale
1. `sale.cap().then(c => {token.mint(sale.address, c);})` -- mints as many tokens as the sale.address is given at start<br />
With that as input:

1. `sale.buyTokens(account1, {value : new web3.utils.BN(web3.utils.toWei("2.5", 'ether')) , from : account1})`
1. `sale.buyTokens(account1, {value : new web3.utils.BN(web3.utils.toWei("15", 'ether')) , from : account1})`
1. `sale.getTokensLeft()`
1. `sale.buyTokens(account1, {value : new web3.utils.BN(web3.utils.toWei("25", 'ether')) , from : account1}) `
Gets this output:

```
1. { Error: Returned error: VM Exception while processing transaction: revert trying to buy too little or too much ether -- Reason given: trying to buy too little or too much ether.
    at XMLHttpRequest._onHttpResponseEnd (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request.js:318:1)
    at XMLHttpRequest._setReadyState (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request.js:208:1)
    at XMLHttpRequestEventTarget.dispatchEvent (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request-event-target.js:34:1)
    at XMLHttpRequest.request.onreadystatechange (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3\~\web3-providers-http\src\index.js:96:1)
    at C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\packages\truffle-provider\wrapper.js:112:1
    at C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3-eth\~\web3-core-requestmanager\src\index.js:140:1
    at Object.ErrorResponse (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3-eth\~\web3-core-helpers\src\errors.js:29:1) reason: 'trying to buy too little or too much ether' }

2. { tx: '0xb16031b41f23c59712f1beeb800343d4c3105a5c23be56d23901f42cf9b09509', receipt: { transactionHash: '0xb16031b41f23c59712f1beeb800343d4c3105a5c23be56d23901f42cf9b09509', transactionIndex: 0, blockHash: '0xfe49d1e19ba4c81c308147805597ae7983f6735a62bbe888140d0f46b1f15335', blockNumber: 9, from: '0xabad44f494343dc39678e5d645cb98e4037cb1b2', to: '0xadf384c858cb10d5a5d63086367c0653eba5b987', gasUsed: 108927, cumulativeGasUsed: 108927, contractAddress: null, logs: [], status: true, logsBloom: '0x00000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000008000000000040080044000000000000000000000000000000000000000004000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000010000000000000000000000000000080000000000000000000000000000000000000000000000000', v: '0x1b', r: '0xc1b607f9d65337d1edfaa790bd522b14df2f8fca192990d9e11f43577c33df76', s: '0x4bd7b15d1a617e0e7bc6d821349ab6cbd91087ec0435057c2f26e1d2fc8bb057', rawLogs: [ [Object] ] }, logs: [] } 

3.<BN: cdd439bfcb494780000> which is 135 ether's worth of tokens. 

4. { Error: Returned error: VM Exception while processing transaction: revert already invested in the crowdsale -- Reason given: already invested in the crowdsale. at XMLHttpRequest._onHttpResponseEnd (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request.js:318:1) at XMLHttpRequest._setReadyState (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request.js:208:1) at XMLHttpRequestEventTarget.dispatchEvent (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request-event-target.js:34:1) at XMLHttpRequest.request.onreadystatechange (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3\~\web3-providers-http\src\index.js:96:1) at C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\packages\truffle-provider\wrapper.js:112:1 at C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3-eth\~\web3-core-requestmanager\src\index.js:140:1 at Object.ErrorResponse (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3-eth\~\web3-core-helpers\src\errors.js:29:1) reason: 'already invested in the crowdsale' }
```
