# Capped-Crowdsale-Token
Author: Nicole Grizzle<br />
Homework 3 for Blockchain and Applications.<br /> This program creates a Solidity contract for a basic capped crowd sale token. The code for this project is based off [this tutorial](https://medium.com/crowdbotics/how-to-build-a-simple-capped-crowdsale-token-using-openzeppelin-library-part-1-2789ec642308), but updated to be compliant with the new version of Solidity.
.
## Getting Started
### Dependencies
* Truffle v5.0.7
* Solidity 0.5.0
* OpenZeppelin 2.2.0+
### Installation
### Answers
#### Part 1:
1. modify this line: `uint256 investorMinCap = 2000000000000000000;` => `uint256 investorMinCap = 5000000000000000000;`
1.
#### Part 2:
<br /> Using this data:
* `ExampleToken.deployed("CSC4980 Token" , "GSU", 18).then((t) => {token = t;})` so token = a deployed ExampleToken
* `web3.eth.getAccounts().then(function(result){account1=result[1];})` so 
* `web3.eth.getAccounts().then(function(result){account0=result[0];})`
* 

1. ```Returned error: VM Exception while processing transaction: revert
    at XMLHttpRequest._onHttpResponseEnd (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request.js:318:1)
    at XMLHttpRequest._setReadyState (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request.js:208:1)
    at XMLHttpRequestEventTarget.dispatchEvent (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\xhr2-cookies\dist\xml-http-request-event-target.js:34:1)
    at XMLHttpRequest.request.onreadystatechange (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3\~\web3-providers-http\src\index.js:96:1)
    at C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\packages\truffle-provider\wrapper.js:112:1
    at C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3-eth-contract\~\web3-core-requestmanager\src\index.js:140:1
    at Object.ErrorResponse (C:\Users\nicol\AppData\Roaming\npm\node_modules\truffle\build\webpack:\~\web3-eth-contract\~\web3-core-helpers\src\errors.js:29:1)```
