pragma solidity >=0.8.25;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

abstract contract RewardsDistributionRecipient is Ownable {
    address public rewardsDistribution;

    constructor(address _owner) Ownable(_owner) { }

    function notifyRewardAmount(uint256 reward) external virtual;

    modifier onlyRewardsDistribution() {
        require(msg.sender == rewardsDistribution, "Caller is not RewardsDistribution contract");
        _;
    }

    function setRewardsDistribution(address _rewardsDistribution) external onlyOwner {
        rewardsDistribution = _rewardsDistribution;
    }
}
