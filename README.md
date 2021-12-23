# pollum-squid-squad

Celebrating our team's journey throughout 2021, Pollum Squid Squad is a procedural pixel art PFP NFT collection airdroped to our members.

![img](./collection.gif)

## Links

- [IPFS](ipfs://QmTyLq4tyC4BG9hnApcw7uuAeTcTw7xAMN8KCPvLooxCNq/)

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