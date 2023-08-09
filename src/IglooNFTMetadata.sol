// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

/// @custom:security-contact viv@snowballtools.xyz
contract IglooNFTMetadata {
    using Strings for uint256;

    /* ========== STATE VARIABLES ========== */

    /* ========== CONSTRUCTOR ========== */
    constructor() {}

    /* ========== VIEWS ========== */

    function bytesToHex(bytes memory buffer) public pure returns (string memory) {
        // Fixed buffer size for hexadecimal convertion
        bytes memory converted = new bytes(buffer.length * 2);

        bytes memory _base = "0123456789abcdef";

        for (uint256 i = 0; i < buffer.length; i++) {
            converted[i * 2] = _base[uint8(buffer[i]) / _base.length];
            converted[i * 2 + 1] = _base[uint8(buffer[i]) % _base.length];
        }

        return string(abi.encodePacked("0x", converted));
    }

    function tokenURI(uint256 tokenId, address ethAddress) public pure returns (string memory) {
        string memory svgData =
            "<svg xmlns='http://www.w3.org/2000/svg' width='1080' height='1080' fill='none' xmlns:v='https://vecta.io/nano'><style><![CDATA[.B{fill-rule:evenodd}.C{stroke-width:34.629}]]></style><g opacity='.1' fill='#fff' class='B'><path d='M370.202 153.392c98.94 5.075 175.544 77.43 246.211 148.288 71.565 71.756 146.966 149.046 152.299 251.292 5.542 106.274-47.841 207.533-124.613 279.55-73.747 69.178-173.773 91.396-273.897 94.275-103.812 2.986-218.245-1.221-289.779-78.064C9.874 772.95 19.01 657.457 22.2 552.972c3.05-99.902 10.673-203.184 75.734-277.888 68.428-78.569 169.401-126.968 272.268-121.692z'/><path d='M370.202 153.392C469.142 158.467 545.746 230.822 616.413 301.68C687.978 373.436 763.379 450.726 768.712 552.972C774.254 659.246 720.871 760.505 644.099 832.522C570.352 901.7 470.326 923.918 370.202 926.797C266.39 929.783 151.957 925.576 80.4225 848.733C9.87405 772.95 19.0101 657.457 22.1996 552.972C25.2493 453.07 32.873 349.788 97.9339 275.084C166.362 196.515 267.335 148.116 370.202 153.392Z' stroke='url(#A)' class='C'/></g><g opacity='.2' fill='#fff' class='B'><path d='M426.377 153.392c98.94 5.075 175.543 77.429 246.211 148.287 71.564 71.757 146.966 149.046 152.299 251.293 5.542 106.274-47.841 207.533-124.613 279.549-73.747 69.179-173.773 91.397-273.897 94.276-103.813 2.986-218.245-1.221-289.78-78.064-70.548-75.784-61.412-191.276-58.223-295.761 3.05-99.902 10.673-203.185 75.735-277.888 68.427-78.57 169.401-126.969 272.268-121.692z'/><path d='M426.377 153.392C525.317 158.467 601.92 230.821 672.588 301.679C744.152 373.436 819.554 450.725 824.887 552.972C830.429 659.246 777.046 760.505 700.274 832.521C626.527 901.7 526.501 923.918 426.377 926.797C322.564 929.783 208.132 925.576 136.597 848.733C66.0488 772.949 75.1848 657.457 78.3744 552.972C81.424 453.07 89.0478 349.787 154.109 275.084C222.536 196.514 323.51 148.115 426.377 153.392Z' stroke='url(#B)' class='C'/></g><g opacity='.5' fill='#fff' class='B'><path d='M543.738 153.392c98.94 5.075 175.543 77.429 246.211 148.287 71.564 71.757 146.966 149.046 152.299 251.293 5.542 106.274-47.841 207.533-124.613 279.549-73.747 69.179-173.773 91.397-273.897 94.276-103.813 2.986-218.245-1.221-289.78-78.064-70.548-75.784-61.412-191.276-58.222-295.761 3.049-99.902 10.673-203.185 75.734-277.888 68.428-78.57 169.401-126.969 272.268-121.692z'/><path d='M543.738 153.392C642.678 158.467 719.281 230.821 789.949 301.679C861.513 373.436 936.915 450.725 942.248 552.972C947.79 659.246 894.407 760.505 817.635 832.521C743.888 901.7 643.862 923.918 543.738 926.797C439.925 929.783 325.493 925.576 253.958 848.733C183.41 772.949 192.546 657.457 195.736 552.972C198.785 453.07 206.409 349.787 271.47 275.084C339.898 196.514 440.871 148.115 543.738 153.392Z' stroke='url(#C)' class='C'/></g><g fill='#fff' class='B'><path d='M661.096 153.392c98.939 5.075 175.543 77.429 246.211 148.287 71.564 71.757 146.963 149.046 152.303 251.293 5.54 106.274-47.85 207.533-124.618 279.549-73.746 69.179-173.773 91.397-273.896 94.276-103.813 2.986-218.245-1.221-289.78-78.064-70.549-75.784-61.413-191.276-58.223-295.761 3.05-99.902 10.673-203.185 75.734-277.888 68.428-78.57 169.402-126.969 272.269-121.692z'/><path d='M661.096 153.392C760.035 158.467 836.639 230.821 907.307 301.679C978.871 373.436 1054.27 450.725 1059.61 552.972C1065.15 659.246 1011.76 760.505 934.992 832.521C861.246 901.7 761.219 923.918 661.096 926.797C557.283 929.783 442.851 925.576 371.316 848.733C300.767 772.949 309.903 657.457 313.093 552.972C316.143 453.07 323.766 349.787 388.827 275.084C457.255 196.514 558.229 148.115 661.096 153.392Z' stroke='url(#D)' class='C'/></g><defs><linearGradient id='A' x1='394.553' y1='153' x2='394.553' y2='927.453' gradientUnits='userSpaceOnUse'><stop offset='.354' stop-color='#8ab9f0'/><stop offset='1' stop-color='#3e96fd'/></linearGradient><linearGradient id='B' x1='450.728' y1='153' x2='450.728' y2='927.453' gradientUnits='userSpaceOnUse'><stop offset='.354' stop-color='#8ab9f0'/><stop offset='1' stop-color='#3e96fd'/></linearGradient><linearGradient id='C' x1='568.089' y1='153' x2='568.089' y2='927.453' gradientUnits='userSpaceOnUse'><stop offset='.354' stop-color='#8ab9f0'/><stop offset='1' stop-color='#3e96fd'/></linearGradient><linearGradient id='D' x1='685.447' y1='153' x2='685.447' y2='927.453' gradientUnits='userSpaceOnUse'><stop offset='.354' stop-color='#8ab9f0'/><stop offset='1' stop-color='#3e96fd'/></linearGradient></defs></svg>";

        string memory ethAddressStr = Strings.toHexString(ethAddress);

        string memory tokenIdStr = Strings.toString(tokenId);

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Igloo NFT #',
                        tokenIdStr,
                        '", "description": "This NFT is a fun igloo nft", "image_data": "',
                        bytes(svgData),
                        '","attributes": [{"trait_type": "ETH Wallet Address", "value": "',
                        ethAddressStr,
                        '"}, {"trait_type": "Token ID", "value": "',
                        tokenIdStr,
                        '"}]}'
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }
}
