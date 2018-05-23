pragma solidity ^0.4.23;

import "../whitelist/whitelist.sol";
import "../ERC721/ERC721Token.sol";

contract issueToken is ERC721Token, Whitelist {
    function issueReward(address _address, uint256 _reward) public restricted {
        require(_address != address(0));
        require(_reward != 0);
        transferFrom(msg.sender, _address, _reward);
    }
}