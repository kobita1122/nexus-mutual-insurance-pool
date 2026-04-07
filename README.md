# Decentralized Insurance Pool (Nexus Mutual-style)

A professional-grade implementation for decentralized risk management. This repository allows users to buy "Cover" against smart contract failures, exchange hacks, or de-pegging events. Instead of a traditional insurance company, the pool is governed by its members who act as risk assessors and claims adjusters.

## Core Features
* **Risk Staking:** Members stake tokens on specific contracts they believe are safe to earn a portion of the premiums.
* **Claims Assessment:** A voting-based system where disinterested members review evidence to approve or deny payouts.
* **Capital Pool:** Uses a "M-of-N" treasury model to ensure that there is always enough liquidity to cover active policies.
* **Flat Architecture:** Single-directory layout for the Cover Registry, Staking Manager, and Claims Engine.



## Logic Flow
1. **Purchase:** A user pays 1 ETH for 100 ETH of coverage on "Protocol X" for 30 days.
2. **Stake:** Risk Assessors stake tokens on "Protocol X" to signal its safety; they receive a share of that 1 ETH.
3. **Claim:** If "Protocol X" is hacked, the user submits a claim with proof of loss.
4. **Vote:** Assessors vote on the claim's validity. If approved, the payout is sent from the Capital Pool to the user.

## Setup
1. `npm install`
2. Deploy `InsurancePool.sol` and `ClaimsManager.sol`.
