// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


interface IIFOPool {

	function init(
		uint256 _pid,
		address _initiator,
		address _sellToken,
		uint _sellAmount,
		address _raiseToken, 
		uint _raiseAmount,
		uint _startTimestamp,
		uint _endTimestamp,
		uint _period,
		string memory _metaData // json string 
	) external;

	function poolInfo() external view returns (
		bool _verified,
		address _initiator,
		address _sellToken,
		uint _sellAmount,
		address _raiseToken, 
		uint _raiseAmount,
		uint _startTimestamp,
		uint _endTimestamp,
		uint _period,
		string memory _metaData, // json string 
		uint256 _userCount,
		uint256 _raiseTotal
	);

	function verify(bool _verified) external;

	// for user
	function depositCUBE() external payable;
	function deposit(uint256 amount) external;
	function quit(uint256 amount) external;
	function claim() external;
	function pending(address user) external view returns (uint256 reward,uint256 refund);

	function rebalance() external;

	function unlockTime() external view returns(uint256 unlock_time);

	// for initiator
	function unlockLiquidity() external;
	function treasurePending() external view returns(uint256 sellTokenAmount, uint256 raiseTokenAmount);
 	function claimTreasure() external;

}
