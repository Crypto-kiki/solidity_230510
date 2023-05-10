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

    Student[] Students;

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

    function pushStudent(uint _number, string memory _name, uint _score) public {
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

        Students.push(Student(_number, _name, _score, _credit));
    }

    // 가장 요약된 코드!! 함수도 들어갈 수 있음. 단, setGrade3함수는 인풋값이 하나 필요함!!
    function pushStudent2(uint _number, string memory _name, uint _score) public {
        Students.push(Student(_number, _name, _score, setGrade3(_score)));
    }

    function getStudent() public view returns(Student[] memory) {
        return Students;
    }

    function setGrade3(uint _score) public pure returns(string memory _credit) {
        if (_score >= 90) {
            return "A";
        } else if (_score >= 80) {
            return "B";
        } else if (_score >= 70) {
            return "C";
        } else {
            return "F";
        }
    }

}


contract IF2 {
    // 50이상이거나 10보다 작으면 (or)
    // 50이상이고 3의 배수이면 (and)
    function setNumber(uint _n) public pure returns(string memory) {
        if(_n >= 50 || _n <=10) {
            return "A";
        // } else if(_n >= 50 && _n % 3 == 0) {
            } else if(_n >= 70 && _n % 3 == 0) {
            return "B";
        } else {
            return "C";
        }
        // 위 함수는 50이라는 범위가 겹치기 때문에 else if 문으로 절대 안넘어옴. 따라서 else if 문에서의 _n 범위를 바꿔줘야함.
    }


    // 70이상이거나 20이하이면 , 50이상이고 5의 배수이면
    function setNumber2(uint _n) public pure returns(string memory) {
        if (_n >= 70 || 20 <= _n) {
            return "o";
        } else if (_n >= 50 && _n % 5 == 0) {
            return "x";
        } else {
            return "y";
        }
    }
}


// ENUM : 열거형, 새로운 상태를 추가하지는 못함.
contract ENUM {
    enum Food {
        Chicken,  // - 0
        Sushi,    // - 1
        Bread,    // - 2
        Coconut   // - 3
    }

    Food a;
    Food b;
    Food c;

    function setA() public {
        a = Food.Chicken;
    }

    function setB() public {
        b = Food.Sushi;
    }

    function setC() public {
        c = Food.Bread;
    }

    function getABC() public view returns(Food, Food, Food) {
        return (a, b, c);
    }
    /* set을 안하고 빈값인 상태에서 getABC()를 실행하면 아래와 같이 나옴. 즉, 문자열로 저장되는게 아니라는 것!
        또한 값이 uint8 (2자리)로 나옴! 따라서 uint8과 형변환이 가능함.
        0:
        uint8: 0
        1:
        uint8: 0
        2:
        uint8: 0
    */
    /* 값을 한 번씩 넣고 실행하면, 아래와 같음. 즉 enum에서의 위치임.
        0:
        uint8: 0
        1:
        uint8: 1
        2:
        uint8: 2
    */
    /*
        uint8 같은 경우는 숫자가 uint8에 들어가서 결과도 uint8이 나옴.
        하지만, enum은 string이 들어가면 숫자인 uint8로 나옴. 따라서 숫자를 문자의 의미로 관리할 수 있음.
        uint8 = 1bytes = 16진수 2자리 ff까지가능 = 즉 16 * 16까지 가능함.
        한정적일 수 있지만, 변수가 256개까지 담기는거면 다른방법을 고안하는게 나을듯!/*
    */
    function getABC2() public view returns(uint8, uint8, uint8) {
        return (uint8(a), uint8(b), uint8(c));
    }
}


contract EMUM2 {
    enum color {
        red,
        orange,
        yellow,
        green,
        blue,
        indigo,
        purple
    }

    color c;

    function setC() public {
        c = color.red;
    }

    function setC2(uint _n) public {
        c = color(_n);
    }

    function getC() public view returns(color) {
        return c;
    }
}

contract ENUM3 {
    // array는 우리가 필요한 곳을 모아서 해체시키고 (푸시, 팝) 등 할 수 있지만
    // enum은 정해놓은 규칙에 따라서 변수가 변하는거임.
    enum Status {
        neutral,
        high,
        low
    }

    /*  enum과 string array 차이점
        1. enum은 안에있는 값이 안변함.
        string[3] st2 = ["neutral", "high", "low"];
        2. enum은 uint8동일하지만 st2는 동적으로 용량이 변함
        3. 가독성
    */


    Status st;  // 이렇게만 선언된 상태에서는 neutral임. 0이니까!
    uint a=5;

    // function higher() public {
    //     a++;
    //     // 7이상
    //     if(a >= 7) {
    //         st = Status.high;
    //     } else {
    //         st = Status.neutral;
    //     }
    // }
    
    // function lower() public {
    //     a--;
    //     // 3이하
    //     if(a <= 3) {
    //         st = Status.low;
    //     } else {
    //         st = Status.neutral;
    //     }
    // }

    function higher() public {
        a++;
        setA();
    }
    
    function lower() public {
        a--;
        setA();
    }

    
    function setA() public {
        if(a >= 7) {
            st = Status.high;
        } else if(a<= 3) {
            st = Status.low;
        } else {
            st = Status.neutral;
        }
    }
    

    function getA() public view returns(uint) {
        return a;
    }

    function getST() public view returns(Status) {
        return st;
    }
}