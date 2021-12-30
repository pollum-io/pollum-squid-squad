# pollum-squid-squad

Celebrating our team's journey throughout 2021, Pollum Squid Squad is a procedural pixel art PFP NFT collection airdroped to our members.

![img](./art/gifs/collection-compressed.gif)

## Links
- IPFS Data - [ipfs://QmYo3bR84ETCumjxk9Aq8hG7kovx16TdkEckFhfuD4e2X4/](https://gateway.pinata.cloud/ipfs/QmYo3bR84ETCumjxk9Aq8hG7kovx16TdkEckFhfuD4e2X4)
- Contract - [0xab17fd4889cc03afc5cfb4bc85a52bfc2be831b4](https://polygonscan.com/address/0xab17fd4889cc03afc5cfb4bc85a52bfc2be831b4)
- [Luxy Collection](https://beta.luxy.io/collection/0xab17FD4889Cc03AFC5CFB4bC85a52BFc2BE831b4)
- [OpenSea Collection](https://opensea.io/collection/pollum/)

## Running
These contracts are compiled and deployed using [Hardhat](https://hardhat.org/).

To prepare the dev environment, run `yarn install`. To compile the contracts, run `npx hardhat compile`. Yarn is available to install [here](https://classic.yarnpkg.com/en/docs/install/#debian-stable) if you need it.

## Deploy Contract
1. Run hardhat command
```shell
npx harhdat run scripts/... --network chosen-network
```

## Generating NFT Collection
```
# create out dir
mkdir -p out
# bootstrap config
nftool traits dump --layers ./layers --out ./out/config.yaml
# - EDIT config.yaml -
# create traits for nft collection
nftool traits make --amount 45 --config ./out/config.yaml --out ./out/collection.json
# generate images 
mkdir -p ./out/images
nftool img gen --width 7000 --height 7000 --collection ./out/collection.json --config ./out/config.yaml --out ./out/images
# generate traits rarity report
nftool rarity traits --collection ./out/collection.json --out ./out/traits_rarity.json
# generate collection rarity rank report
nftool rarity collection --collection ./out/collection.json --out ./out/collection_rarity.json
# generate provenance
nftool provenance --images ./out/images --out ./out/provenance.json --startingIndex 0
# - UPLOAD images to IPFS -
# - EDIT config.yaml to have correct IPFS hash for folder -
# generate ERC-721 metadata
mkdir -p ./out/metadata
nftool metadata --collection ./out/collection.json --config ./out/config.yaml --out ./out/metadata
```

## License
MIT
