const { ethers } = require('hardhat');

async function main() {
    // Get the contract to deploy
    const ContractFactory = await ethers.getContractFactory("SquidSquad");
    const squid = ContractFactory.attach("0xab17FD4889Cc03AFC5CFB4bC85a52BFc2BE831b4");
    const owner = "0xAa93866E06c2Ec1fBDb5037D5495a3Aa6DB8F897";

    var hashs = "ipfs://QmQqZLH7nDJhzN5X9MbTqyMhV9VLQbLgAETKdKhGV27YBK/"

    const index = (await squid.totalSupply()).toNumber();
    // for (var i = 0; i < 45; i++) {

    const txid = await squid.mintSquid(
        owner,
        hashs + index,
    );
    console.log("Txid for: ", txid.hash);
    console.log(index)

    // }
    // const txid = await squid.mint(
    //     owner,
    //     hashs + index,
    // );
    // console.log("Txid for: ", txid.hash);
    // console.log(hashs + index)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });