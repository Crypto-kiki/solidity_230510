// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract abc {
    struct Student{
        string name;
        uint number;
        string[] classes;
    }

    mapping(string => Student[]) Teacher_Student;

    function pushTeacher(string memory _teacher, string memory _name, uint _number, string[] memory _classes) public {
        Teacher_Student[_teacher].push(Student(_name, _number, _classes));
    }

    function get(string memory _teacher) public view returns(Student[] memory){
        return Teacher_Student[_teacher];
    }
    // 결과 :     0:    tuple(string,uint256,string[])[]: bob,1,math,cathy,2,english

}