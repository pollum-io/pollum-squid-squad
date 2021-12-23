
const hre = require("hardhat");

async function main() {


  // We get the contract to deploy
  const SquidSquad = await hre.ethers.getContractFactory("SquidSquad");
  const squid = await SquidSquad.deploy("Squid Squad", "SQUID");

  await squid.deployed();

  console.log("SquidSquad to:", squid.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
