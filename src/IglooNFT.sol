// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Counters} from "@openzeppelin/contracts/utils/Counters.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721Burnable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import {IERC721Metadata} from "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import {IERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import {IglooNFTMetadata} from "./IglooNFTMetadata.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @custom:security-contact viv@snowballtools.xyz
contract IglooNFT is ERC721("IglooNFT", "IGLOO"), ERC721Enumerable, ERC721Burnable, Ownable, ReentrancyGuard {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    IglooNFTMetadata public iglooNFTMetadata;

    constructor() {}

    function safeMint(address to) public returns (uint256) {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        tokenURI(tokenId);
        return tokenId;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return iglooNFTMetadata.tokenURI(tokenId, address(this));
    }

    function setIglooNftMetadataAddress(address iglooNftMetadataAddress) public onlyOwner {
        iglooNFTMetadata = IglooNFTMetadata(iglooNftMetadataAddress);
        emit IglooNftMetadataAddressSet(iglooNftMetadataAddress);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        virtual
        override(ERC721, ERC721Enumerable)
    {
        ERC721Enumerable._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return interfaceId == type(IERC721Enumerable).interfaceId || interfaceId == type(IERC721Metadata).interfaceId
            || interfaceId == type(IERC721).interfaceId;
    }

    /* ========== EVENTS ========== */

    event IglooNftMetadataAddressSet(address indexed iglooNftMetadataAddress);
}
