// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../src/IglooNFT.sol";

contract IglooNFTTest is Test {
  IglooNFT public instance;

  function setUp() public {
    instance = new IglooNFT();
  }

  function testUri() public {
    assertEq(instance.uri(0), "");
  }
}
