// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "forge-std/Test.sol";
import "../src/IglooNFT.sol";
import "../src/IglooNFTMetadata.sol";

contract IglooNFTTest is Test, IERC721Receiver {
    IglooNFTMetadata public metadata;
    IglooNFT public instance;
    uint256 public tokenId;

    function setUp() public {
        metadata = new IglooNFTMetadata();
        instance = new IglooNFT();

        instance.setIglooNftMetadataAddress(address(metadata));
    }

    function testSafeMint() public {
        tokenId = instance.safeMint(address(this));
        assertEq(instance.ownerOf(tokenId), address(this));
    }

    function testOwner() public {
        assertEq(instance.owner(), address(this));
    }

    function testUri() public {
        assertEq(instance.tokenURI(tokenId), metadata.tokenURI(tokenId, address(instance)));
    }

    function testBurn() public {
        instance.burn(instance.safeMint(address(this)));
        assertEq(instance.balanceOf(address(this)), 0);
    }

    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data)
        external
        pure
        override
        returns (bytes4)
    {
        return this.onERC721Received.selector;
    }
}
