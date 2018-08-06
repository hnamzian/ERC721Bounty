pragma solidity ^0.4.23;

import "../Migrations.sol";
import "../whitelist/whitelist.sol";
import "../ERC721/ERC721Token.sol";

contract issueToken is ERC721Token, Whitelist {
    modifier canTransfer(uint256 _tokenId) {
        require(whitelistReward[msg.sender].transferable == true, "You're no whitelisted!");
        require(isApprovedOrOwner(msg.sender, _tokenId), "You're not allowed transfer tokens!");
        _;
    }

    function MintTokenByOwner(uint256 _tokenId) public restricted {
        _mint(msg.sender, _tokenId);
    }

    function issueReward(address _address, uint256 _tokenId) public restricted {
        require(_address != address(0), "invalid input address!");
        require(_tokenId != 0, "invlaid bounty id!");
        transferFrom(msg.sender, _address, _tokenId);
    }
}