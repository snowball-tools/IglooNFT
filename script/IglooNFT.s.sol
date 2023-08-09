// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Script.sol";
import "../src/IglooNFT.sol";

contract IglooNFTScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        IglooNFTMetadata metadata = new IglooNFTMetadata();
        console.log("IglooNFTMetadata contract deployed to %s", address(metadata));

        IglooNFT instance = new IglooNFT();
        console.log("Contract deployed to %s", address(instance));

        instance.setIglooNftMetadataAddress(address(metadata));
        console.log("IglooNFTMetadata address set to %s", address(metadata));

        vm.stopBroadcast();
    }
}
