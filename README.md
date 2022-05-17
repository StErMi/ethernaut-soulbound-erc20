# Ethenaut Bounty: Soulbound ERC20

Ropsten Testnet contract: https://ropsten.etherscan.io/address/0xcf4111362047bca0ad7e0c584b878d79c98cea04#code

## Features

- Soulbound ERC20: minted tokens cannot be transferred
- Limitless minting
- Mint can be done only by **minter** role
- Call `setApprovedMinter` to set a new minter

## Getting Started

```sh
forge init
forge build
forge test
```

## Deployment

Copy `.env.example` to `.env` and fill in the values.

```sh
npm install
npm run deploy:ropsten
```
