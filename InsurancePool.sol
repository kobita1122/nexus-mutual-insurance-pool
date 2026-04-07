// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title InsurancePool
 * @dev Manages the purchase of coverage and the capital reserve.
 */
contract InsurancePool is Ownable, ReentrancyGuard {
    struct Cover {
        address user;
        uint256 amount;
        uint256 expiry;
        bool claimed;
    }

    mapping(uint256 => Cover) public covers;
    uint256 public nextCoverId;
    uint256 public poolBalance;

    event CoverPurchased(uint256 indexed id, address indexed user, uint256 amount);

    constructor() Ownable(msg.sender) {}

    function buyCover(uint256 _amount, uint256 _duration) external payable {
        require(msg.value == _amount / 100, "Premium must be 1% of cover");
        
        covers[nextCoverId] = Cover({
            user: msg.sender,
            amount: _amount,
            expiry: block.timestamp + _duration,
            bool claimed: false
        });

        poolBalance += msg.value;
        emit CoverPurchased(nextCoverId++, msg.sender, _amount);
    }

    function payout(uint256 _coverId) external onlyOwner nonReentrant {
        Cover storage c = covers[_coverId];
        require(!c.claimed, "Already paid");
        require(block.timestamp <= c.expiry, "Cover expired");

        c.claimed = true;
        payable(c.user).transfer(c.amount);
    }

    receive() external payable {
        poolBalance += msg.value;
    }
}
