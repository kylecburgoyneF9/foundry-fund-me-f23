// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {HelperConfig} from "../script/HelpConfig.s.sol";
import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Anything before startBroadcast, not going to be 'real' transaction
        HelperConfig helpConfig = new HelperConfig();
        address ethUsdPriceFeed = helpConfig.activeNetworkConfig();

        // Anything after startBroadcast, it will be a 'real' transaction
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
