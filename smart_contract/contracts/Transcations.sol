//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Transcations {
    uint256 transcationCount;
    
    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);

    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message; 
        uint256 timestamp; 
        string keyword;
    }

    TransferStruct[] transcations;

    function addToBlockChain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        transcationCount += 1;
        transcations.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));

        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    function getAllTranscations() public view returns (TransferStruct[] memory) {
        return transcations;
    }

    function getTranscantionsCounter() public view returns (uint256) {
        return transcationCount;
    }
}
