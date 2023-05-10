// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract abc {
    struct Student{
        string name;
        uint number;
        string[] classes;
    }

    Student[] students;

    function setStudents(string memory _name, uint _number, string[] memory _classes) public {
        students.push(Student(_name, _number, _classes));
    }

    function getStudents(uint _n) public view returns(Student memory) {
        return students[_n - 1];
    }

    function getName(uint _n) public view returns(string memory) {
        return students[_n - 1].name;
    }


    mapping(string => Student[]) Teacher_Student;

    function pushTeacher(string memory _teacher, string memory _name, uint _number, string[] memory _classes) public {
        Teacher_Student[_teacher].push(Student(_name, _number, _classes));
    }

    function get(string memory _teacher) public view returns(Student[] memory){
        return Teacher_Student[_teacher];
    }
    // 결과 :     0:    tuple(string,uint256,string[])[]: bob,1,math,cathy,2,english



    // n번 요소의 number를 수정하고 싶을 때!
    function set(string memory _teacher, uint _n, uint _number) public {
        Teacher_Student[_teacher][_n - 1].number = _number;
    }

}