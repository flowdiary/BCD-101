// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract AgeStorage {
    uint256 age;
    uint256[] public numbers = [1, 2, 3];
    Person[] public people;

    struct Person {
        string name;
        uint256 age;
    }

    function storeAge(uint256 _age) public {
        age = _age;
    }

    mapping(string => uint256) public nameToAge;

    Person public yasin = Person("Yasin", 23);
    Person public zubairu = Person("Zubairu", 20);

    function getAge() public view returns (uint256) {
        return age;
    }

    function addNumber(uint256 _num) public {
        numbers.push(_num);
    }

    function addPerson(string memory _name, uint256 _age) public {
        people.push(Person(_name, _age));
        nameToAge[_name] = _age;
    }

    function removeLast() public {
        numbers.pop();
    }
}
