const main = async () => {
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
    console.log("Contract deployed to: ", waveContract.address);

};

const runMain = async () => {
    try {
        await main(); 
        process.exit(0); //exit Node process without error
    } catch (error) {
        console.log(error);
        process.exit(1); // exit Node process while indicating "Uncaught Fatal Exception" error
    }
};
runMain();