//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//import "../node_modules/hardhat/console.sol";
//import "../node_modules/@openzeppelin/contracts/access/Ownable.sol"; 

contract StudentDatabase {
    
    address public owner;
    address[] public studentIndex;

    struct Student {
        uint percentage;
        uint totalMarks;
    }

    mapping (address => Student) public students;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }

    function register(
        address studentID,
        uint percentage_,
        uint totalMarks_
    ) public onlyOwner returns(bool success) {
        students[studentID].percentage = percentage_;
        students[studentID].totalMarks = totalMarks_;

        studentIndex.push(studentID);
        return true;
    }

    function getStudentDetails(address studentID) public view returns(uint percentage, uint totalMarks) {
        return (
            students[studentID].percentage,
            students[studentID].totalMarks
        );
    }
}