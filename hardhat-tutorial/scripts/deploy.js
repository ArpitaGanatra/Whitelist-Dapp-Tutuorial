const {ethers} = require("hardhat");

async function main() {
    // get contract from the contract folder
    // creates an instance of our contract
    const whitelistContract = await ethers.getContractFactory("Whitelist");

    //deploy contract
    // 10 is a value for constructor in the contract
    // represents max whitelist address capacity
    const deployedWhitelistContract = await whitelistContract.deploy(10);

    // confirm deployement
    await deployedWhitelistContract.deployed();

    //console the address of the contract for confirmation
    console.log("Whitelist Contract Address", deployedWhitelistContract.address);
    //Whitelist Contract Address 0x04bBdDF298e04cb7bf19bAd3cE80c31dE8502bF5
}

main()
.then(() => process.exit(0))
.catch((error) => {
    console.log(error);
    process.exit(1);
})