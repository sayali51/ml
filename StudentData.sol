// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData{

    // Structure
    struct Student {
        uint256 id;
        string name;
        uint256 age;
        string course;
    }

    // Array of structures
    Student[] public students;

    event StudentAdded(uint256 id, string name);
    event FallbackCalled(address sender, uint256 value, bytes data);

    function addStudent(
        uint256 _id,
        string memory _name,
        uint256 _age,
        string memory _course
    ) public {
        students.push(Student(_id, _name, _age, _course));
        emit StudentAdded(_id, _name);
    }

    function getStudent(uint256 index)
        public
        view
        returns (uint256, string memory, uint256, string memory)
    {
        require(index < students.length, "Invalid index");
        Student memory s = students[index];
        return (s.id, s.name, s.age, s.course);
    }

    function getTotalStudents() public view returns (uint256) {
        return students.length;
    }

    // Fallback function
        receive() external payable {
        emit FallbackCalled(msg.sender, msg.value, "");
    }
}
