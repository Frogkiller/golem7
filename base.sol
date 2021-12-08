// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract token is ERC1155 {
    uint256 public constant FUNGIBLE = 0;
    uint256 public constant NON_FUNGIBLE = 1;

    constructor() ERC1155("JSON_URI") {
        _mint(msg.sender, FUNGIBLE, 100, "");
        _mint(msg.sender, NON_FUNGIBLE, 1, "");
    }
}
