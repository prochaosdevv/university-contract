// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract University {
    address public admin;
    uint256 public studentCount;

    struct StudentData {
        string enrollmentHash;
        string certificateHash;
        string icNumber;
    }

    mapping(uint256 => StudentData) private students;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    /// @notice Store all student data (enrollment, certificate, IC) at once
    /// @param studentId Unique student ID
    /// @param enrollmentHash IPFS hash of enrollment details
    /// @param certificateHash IPFS hash of certificate
    /// @param icNumber IC number of the student
    function storeStudentData(
        uint256 studentId,
        string calldata enrollmentHash,
        string calldata certificateHash,
        string calldata icNumber
    ) external {
        require(bytes(students[studentId].enrollmentHash).length == 0, "Student already exists");
        
        students[studentId] = StudentData(enrollmentHash, certificateHash, icNumber);
        studentCount++;
    }

    /// @notice Get total number of students added
    /// @return Total student count
    function getStudentCount() external view returns (uint256) {
        return studentCount;
    }
}
