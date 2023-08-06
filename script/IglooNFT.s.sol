// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Script.sol";
import "../src/IglooNFT.sol";

contract IglooNFTScript is Script {
  function setUp() public {}

  function run() public {
    vm.startBroadcast();
    IglooNFT instance = new IglooNFT();
    console.log("Contract deployed to %s", address(instance));
    vm.stopBroadcast();
  }
}
