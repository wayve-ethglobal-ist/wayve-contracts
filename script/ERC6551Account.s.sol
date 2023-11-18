// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {ERC6551Account} from "../src/ERC6551Account.sol";

contract Deploy is Script {
    bytes32 internal constant SALT =
        bytes32(
            abi.encode(0x57617976654163636f756e74496d706c656d656e746174696f6e)
        ); // ~ "WayvAccountImplementation"

    function run() external {
        // set up deployer
        uint256 privKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.rememberKey(privKey);
        // log deployer data
        console2.log("Deployer: ", deployer);
        console2.log("Deployer Nonce: ", vm.getNonce(deployer));

        vm.startBroadcast(deployer);

        // deploy ERC6551Account
        ERC6551Account account = new ERC6551Account();

        // log account data
        console2.log("Account deployed: ", address(account));
    }
}
