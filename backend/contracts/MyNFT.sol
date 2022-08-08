// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 < 0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    uint256 totalsupply = 100;

    Counters.Counter private _tokenIds;

    constructor() ERC721("LADYGANGS","LADY"){
            }

    function mintNFT(address recepient,string memory tokenURI) public returns(uint256){
        
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();

        require(newItemId <= 100, "NFT is Sold Out");
        _mint(recepient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
