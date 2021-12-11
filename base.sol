// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/Pausable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract token is ERC1155, Ownable, Pausable {
    uint256 public constant SCRAP = 0;
    uint256 public constant FUEL = 1;

    struct Ship {
        uint8 damage;
    }
    uint256 nextId = 10;

    mapping (uint256 => Ship) private _tokenDetails;


    constructor() ERC1155("JSON_URI") {
    }

    function getTokenDetails(uint256 tokenId) public view returns(Ship memory){
        return _tokenDetails[tokenId];
    }

    function mintShip(uint8 damage) public onlyOwner{
        _tokenDetails[nextId] = Ship(damage);
        _mint(msg.sender, nextId, 1, "");
        nextId++;
    }
}
