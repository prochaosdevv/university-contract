const { ethers } = require("hardhat");

async function main() {
    const University = await ethers.getContractFactory("University");
    const university = await University.deploy();
    await university.deployed();
    console.log("University contract deployed to:", university.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
