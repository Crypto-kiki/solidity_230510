// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract IF{
    // 점수가 50점 이상이면 P, 아니면 F
    function setGrade(uint _score) public pure returns(string memory) {
        if(_score >= 50) {
            return "P";
        } else {
            return "F";
        }
    }

    // 점수가 70점 이상이면 A, 50점 이상이면 B, 아니면 C반
    function setGrade2(uint _score) public pure returns(string memory) {
        if(_score >= 70) {
            return "A";
        } else if(_score >= 50) {
            return "B";
        } else {
            return "C";
        }
    }

    // 짝수면 even array에, 홀수면 odd array에 넣기
    uint[] even;
    uint[] odd;

    function divide(uint _n) public {
        if(_n % 2 == 0) {
            even.push(_n);
        } else {
            odd.push(_n);
        }
    }

    function getArray() public view returns(uint[] memory, uint[] memory) {
        return (even, odd);
    }

    uint[] A;
    uint[] B;
    uint[] C;

    // ternary 는 3진법 이라는 뜻!
    function ternary(uint _n) public {
        if(_n % 1 == 1) {
            A.push(_n);
        } else if(_n % 3 == 2) {
            B.push(_n);
        } else {
            C.push(_n);
        }
    }

    struct Student {
        uint number;
        string name;
        uint score;
        string credit;
    }

    Student Alice;
    Student Bob;
    Student Charlie;

    /*
    1. 1, Alice, 90 -> setA()
    2. 2, Bob, 75 -> setB()
    3. 3, Charli, 85 -> setC()
    */

    // 학생 정보 중 번호, 이름, 점수만 하면 학점은 자동 계산해주는 함수
    // 점수가 90점 이상이면 A, 80점 이상이면 B, 70점 이상이면 C, 나머지는 F
    // 인풋값이 3개여도 가능함!
    function setAlice(uint _number, string memory _name, uint _score) public {
        string memory _credit;
        if (_score >= 90) {
            _credit = "A";
        } else if (_score >= 80) {
            _credit = "B";
        } else if (_score >= 70) {
            _credit = "C";
        } else {
            _credit = "F";
        }

        Alice = Student(_number, _name, _score, _credit);
    }

    function setBob(uint _number, string memory _name, uint _score) public {
        string memory _credit;
        if (_score >= 90) {
            _credit = "A";
        } else if (_score >= 80) {
            _credit = "B";
        } else if (_score >= 70) {
            _credit = "C";
        } else {
            _credit = "F";
        }

        Bob = Student(_number, _name, _score, _credit);
    }

    function setCharlie(uint _number, string memory _name, uint _score) public {
        string memory _credit;
        if (_score >= 90) {
            _credit = "A";
        } else if (_score >= 80) {
            _credit = "B";
        } else if (_score >= 70) {
            _credit = "C";
        } else {
            _credit = "F";
        }

        Charlie = Student(_number, _name, _score, _credit);
    }

    function getStudents() public view returns(Student memory, Student memory, Student memory) {
        return (Alice, Bob, Charlie);
    }

}