pragma solidity ^0.4.23;
import "../Migrations.sol";

contract Whitelist is Migrations {
    struct reward {
        bool transferable;
        bool blocked;
    }

    mapping(address => reward) whitelistReward;

    function addToWhitelist(address _wAddress, bool _transferable) public restricted {
        require(_wAddress != address(0), "invalid input address!");
        reward storage newReward = whitelistReward[_wAddress];
        newReward.transferable = _transferable;
        newReward.blocked = false;
    }

    function blockFromWhitelist(address _wAddress) public restricted {
        require(_wAddress != address(0), "invalid input address!");
        whitelistReward[_wAddress].blocked = true;
    }

    function unblockFromWhitelist(address _wAddress) public restricted {
        require(_wAddress != address(0), "invalid input address!");
        whitelistReward[_wAddress].blocked = false;
    }

    function setTransferable(address _wAddress, bool _transferable) public restricted {
        require(_wAddress != address(0), "invalid input address!");
        whitelistReward[_wAddress].transferable = _transferable;
    }

}