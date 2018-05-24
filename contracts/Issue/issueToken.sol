pragma solidity ^0.4.23;

import "../Migrations.sol";
import "../whitelist/whitelist.sol";
import "../ERC721/ERC721Token.sol";

contract issueToken is ERC721Token, Whitelist {
    modifier canTransfer(uint256 _tokenId) {
        require(whitelistReward[msg.sender].transferable == true);
        require(isApprovedOrOwner(msg.sender, _tokenId));
        _;
    }

    function MintTokenByOwner(uint256 _tokenId) public restricted {
        _mint(msg.sender, _tokenId);
    }

    function issueReward(address _address, uint256 _tokenId) public restricted {
        require(_address != address(0));
        require(_tokenId != 0);
        transferFrom(msg.sender, _address, _tokenId);
    }
}