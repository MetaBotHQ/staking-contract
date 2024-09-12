// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import { Script } from "forge-std/src/Script.sol";
import { console2 } from "forge-std/src/console2.sol";
import { StakingRewards } from "src/StakingRewards.sol";

contract DeployStakingReward is Script {
    address public owner;
    address public rewardsDistribution;
    address public rewardsToken;
    address public stakingToken;

    function run() external {
        assert(owner != address(0));
        assert(rewardsDistribution != address(0));
        assert(rewardsToken != address(0));
        assert(stakingToken != address(0));

        vm.startBroadcast();

        //deploy StakingRewards  contract
        StakingRewards stakingRewardsContract =
            new StakingRewards(owner, rewardsDistribution, rewardsToken, stakingToken);

        console2.log("Staking rewards contract deployed at", address(stakingRewardsContract));
        vm.stopBroadcast();
    }
}
