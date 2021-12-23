# pollum-squid-squad

Celebrating our team's journey throughout 2021, Pollum Squid Squad is a procedural pixel art PFP NFT collection airdroped to our members.

![img](./art/gifs/collection-compressed.gif)

## Links

- IPFS Optimized Images - [ipfs://QmcFASTWJ8cXouSfFG5ScTGSeMF59CWhU5YfAGRtrXu1VT/](https://bafybeigoto7ynrphrb4wc62jv62pfwjqsfoduikndzxvzydiut4le74f2i.ipfs.dweb.link/)
- IPFS HD Images - [ipfs://QmbPgRNRPTS2LT2HDW9H3dgGkcx2KhmycQVAbq9RkMUqoo/](https://bafybeigb52nyxn7vwj2cc7orfl2nyexhfkhxgwrauar6leqwdxms3drmwi.ipfs.dweb.link/)
- IPFS Metadata - [ipfs://QmQqZLH7nDJhzN5X9MbTqyMhV9VLQbLgAETKdKhGV27YBK/](https://bafybeibfd4rwktd4tbxcjyxnxmkqdurb36omtthrqcog6lyv6lweu2ve6i.ipfs.dweb.link/)

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