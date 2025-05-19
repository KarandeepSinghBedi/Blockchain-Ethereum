// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    struct Student { 
        uint Id;  
        string Name;  
        string Grade;      
    }
    
    mapping(uint => Student) public students; 

    function addStudent (uint studentId, string memory name, string memory grade) public {
        students[studentId] = Student(studentId, name, grade);
    }
    
    function getStudent (uint studentId) view public returns(Student memory){
        return students[studentId];        
    }
}