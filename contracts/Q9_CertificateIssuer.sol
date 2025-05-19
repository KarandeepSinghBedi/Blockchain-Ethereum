// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificateIssuer {

    address public university;

    struct Certificate {
        string name;
        string courseId;
        string issueDate;
    }

    mapping(uint => Certificate) public certificates;

    constructor() {
        university = msg.sender;
    }

    function issueCertificate(uint studentId, string memory name, string memory course, string memory issueDate) public {
        require(msg.sender == university, "Only university can issue");
        certificates[studentId] = Certificate(name, course, issueDate);
    }

    function getCertificate(uint studentId) public view returns (Certificate memory) {
        return certificates[studentId];
    }

}