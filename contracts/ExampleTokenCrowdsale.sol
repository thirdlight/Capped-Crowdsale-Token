pragma solidity ^0.5.0;


import "../node_modules/openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract ExampleTokenCrowdsale is Crowdsale, MintedCrowdsale, CappedCrowdsale{


	mapping(address => uint256) public contributions;
    uint256 tokensLeft;
    
    
	constructor(uint256 _rate,
	  address _wallet,
	  ERC20 _token,
	  uint256 _cap)
	Crowdsale(_rate, address(uint160(_wallet)), _token)
	CappedCrowdsale(_cap)
	public{
        tokensLeft = _cap * _rate;
	}

    function getTokensLeft() public view returns (uint256) {
        return tokensLeft;
    }
  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    //minimum investor Contribution - 50000000000000000000
	//minimum investor Contribution - 50000000000000000000
	uint256 investorMinCap = 5000000000000000000;
	uint256 investorHardCap = 50000000000000000000;
    
      // also works if commented out
    uint256 _existingContribution = contributions[_beneficiary];
    uint256 _newContribution = _weiAmount;
    require(_existingContribution == 0, "already invested in the crowdsale");
    require(_newContribution >= investorMinCap  && _newContribution <= investorHardCap, "trying to buy too little or too much ether");
    super._preValidatePurchase(_beneficiary, _weiAmount);
    tokensLeft = tokensLeft.sub(_weiAmount* this.rate()) ;
	contributions[_beneficiary] = _existingContribution.add(_newContribution);      
    
  }
}