/*

                     ***              **                    
                 *******              ******,               
             ***********              ***********           
        ****************              ***************       
    ,*******************              *******************   
   ******************                    ****************** 
  **************                             ***************
  **********                                     ***********
  **********                                     ***********
  **********                                     ***********
  **********                                     ***********
  **********                                     ***********
  **********                                     ***********
  **********                                     ***********
  **********                                     ***********
  **********                                     ***********
  ************                                 .************
  ****************                         **************** 
   *******************                 *******************  
      *********************        ********************.    
          *****************************************         
              *********************************             
                   ************************                 
                       ***************                      
                           .******             
*/

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SquidSquad is ERC721URIStorage, ERC721Enumerable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Base URI
    string public baseURI;

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {}

    function mint(address payable _recipient, string memory _metadata)
        external
        returns (uint256)
    {
        uint256 itemId = _tokenIds.current();
        _safeMint(_recipient, itemId);
        _setTokenURI(itemId, _metadata);
        _tokenIds.increment();
        return itemId;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 _interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return
            _interfaceId == type(ERC721URIStorage).interfaceId ||
            _interfaceId == type(ERC721Enumerable).interfaceId ||
            super.supportsInterface(_interfaceId);
    }

    /**
     * @dev Internal function to set the base URI for all token IDs. It is
     * automatically added as a prefix to the value returned in {tokenURI}.
     */
    function _setBaseURI(string memory baseURI_) internal virtual {
        baseURI = baseURI_;
    }

    /**
     * @dev Base URI for computing {tokenURI}. The resulting URI for each
     * token will be the concatenation of the `baseURI` and the `tokenId`.
     * See {ERC721Upgradeable-_baseURI}.
     */
    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    /**
     * @dev See {ERC721EnumerableUpgradeable-_beforeTokenTransfer}.
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    /**
     * @dev See {ERC721URIStorageUpgradeable-_burn}.
     */
    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }
}
