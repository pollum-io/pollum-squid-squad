const { ethers } = require('hardhat');

async function main() {
    // Get the contract to deploy
    const ContractFactory = await ethers.getContractFactory("SquidSquad");
    const squid = ContractFactory.attach("0x4ECD14ac3581f829a4f5Cd259E6Dc8a8eE8d64BD");
    const owner = "0x0a1c3312c808b23D019bF241028f6B5624f4cc98";

    var hashs = "ipfs://QmSEopRomudWwpJecLJ9J4wcfa6Tm6ePDXsPLS9xyddvqG/"

    for (var i = 0; i < 45; i++) {

        const txid = await squid.mint(
            owner,
            hashs + i,
        );
        console.log("Txid for: ", txid);

    }
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });