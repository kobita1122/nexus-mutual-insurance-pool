const hre = require("hardhat");

async function main() {
  const Insurance = await hre.ethers.getContractFactory("InsurancePool");
  const insurance = await Insurance.deploy();

  await insurance.waitForDeployment();
  console.log("Insurance Pool deployed to:", await insurance.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
