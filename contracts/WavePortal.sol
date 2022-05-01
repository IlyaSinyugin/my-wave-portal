// SPX-License-Identifier: UNLICENSED
// means contract uses no license

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    // added event
    event NewWave(address indexed from, uint256 timestamp, string message);

    // created structure aka custom datatype
    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    // storing array of structs
    Wave[] waves;

    constructor() {
        console.log("I am a smart contract. Hello World!");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender, _message);
        // msg.sender - wallet address of the person who called the function

        // store data in array
        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    // return struct array waves
    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    // view function - doesn't alter the state variable but only reads them
    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}
