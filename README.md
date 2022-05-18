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

**VERY IMPORTANT:** DO NOT SHARE YOUR PRIVATE KEY WITH ANYONE and check that they are not on your github project. Use a test wallet to do this.

More info about the Deployment command on the [Foundry book documentation site](https://book.getfoundry.sh/forge/deploying.html?highlight=deploy#deploying).

We are going to deploy this contract on Ropsten testnet. That's why the `chain-id` is set to `3` in the `verify-contract` command.
In order to do that you need to get an RCP_URL from Alchemy or Infura. Replace `YOUR_ROPSTEN_RCP_URL` with your own.

```sh
forge create --rpc-url YOUR_ROPSTEN_RCP_URL --private-key YOUR_PRIVATE_KEY src/Exp.sol:Exp
```

## Deployment

More info about the Verifying command on the [Foundry book documentation site](https://book.getfoundry.sh/forge/deploying.html?highlight=deploy#verifying).

We have deployed our contract on Ropsten. That's why the `chain-id` is set to `3` in the `verify-contract` command.
`YOUR_CONTRACT_ADDRESS` will be the address of the contract on the chain you have deployed it.

```sh
forge verify-contract --chain-id 3 YOUR_CONTRACT_ADDRESS src/Exp.sol:Exp YOUR_ETHERSCAN_API_KEY
```
