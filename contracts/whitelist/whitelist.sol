pragma solidity ^0.4.23;

import "../Migrations.sol";

contract Whitelist is Migrations {
    struct reward {
        bool transferable;
        bool blocked;
    }

    mapping(address => reward) whitelistRewarded;

    function addToWhitelist(address _wAddress, bool _transferable) public restricted {
        require(_wAddress != address(0));
        reward storage newReward = whitelistRewarded[_wAddress];
        newReward.transferable = _transferable;
        newReward.blocked = false;
    }

    function blockFromWhitelist(address _wAddress) public restricted {
        require(_wAddress != address(0));
        whitelistRewarded[_wAddress].blocked = true;
    }

    function unblockFromWhitelist(address _wAddress) public restricted {
        require(_wAddress != address(0));
        whitelistRewarded[_wAddress].blocked = false;
    }

    function setTransferable(address _wAddress, bool _transferable) public restricted {
        require(_wAddress != address(0));
        whitelistRewarded[_wAddress].transferable = _transferable;
    }

}