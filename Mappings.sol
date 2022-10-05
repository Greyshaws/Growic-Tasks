// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//import "../node_modules/@openzeppelin/contracts/access/Ownable.sol"; 

contract UserBalance {
    
    address public owner;

    constructor() {
    owner = msg.sender;
    }
   
    mapping(address => uint) public balance;
    
    function deposit(uint256 amount) public payable {
        balance[msg.sender] += amount ;
    }
    function checkBalance() public view returns (uint) {
        return balance[msg.sender];
    }
    
}