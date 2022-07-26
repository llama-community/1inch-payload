#!/usr/bin/env bash
if [ ! -f ../.env ]
then
  export $(cat .env | xargs)
fi

# Read the Testnet RPC URL
echo Enter your Testnet RPC URL:
echo Example: "https://eth-rinkeby.alchemyapi.io/v2/XXXXXXXXXX"
read -s rpc

# Read the constructor arguments
echo Enter constructor arguments separated by spaces \(eg 1 2 3\):
read -ra args

if [ -z "$args" ]
then
  FOUNDRY_PROFILE=deploy forge create -i --rpc-url ${rpc} ./src/1InchListingPayload.sol:OneInchListingPayload --verify
else
  FOUNDRY_PROFILE=deploy forge create -i --rpc-url ${rpc} --constructor-args ${args} ./src/1InchListingPayload.sol:OneInchListingPayload --verify
fi
