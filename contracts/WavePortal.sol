// SPX-License-Identifier: UNLICENSED
// means contract uses no license

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    constructor() {
        console.log("I am a smart contract. Hello World!");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        // msg.sender - wallet address of the person who called the function
    }

    // view function - doesn't alter the state variable but only reads them
    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}
