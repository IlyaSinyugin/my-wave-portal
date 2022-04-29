// file for server deployments
// in particular it creates a new block on 
// the local Ethereum network 
// block - batch of transaction with a hash of the previous 
// block on the chain 

const { hexStripZeros } = require("ethers/lib/utils")

// write "npx hardhat node" to start a local Ethereum network 
const main = async () => {
    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();

    console.log("Deploying contracts with account: ", deployer.address);
    console.log("Account balance: ", accountBalance.toString());

    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();

    console.log("WavePortal address: ", waveContract.address);
}

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
}

runMain();