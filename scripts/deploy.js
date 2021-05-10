async function main() {
  // We get the contract to deploy
  const Oracle = await ethers.getContractFactory("Oracle");
  const oracle = await Oracle.deploy();

  console.log("Oracle deployed to:", oracle.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });