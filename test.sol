// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract CaseRecords {
    struct Case {
        string case_no;
        string[] accused;
        uint256 case_id;
    }

    mapping(uint256 => Case) public cases;

    uint256 public numberOfCases = 0;

    function createCase(string memory _case_no,string[] memory _accused) public returns (uint256) {
        Case storage c = cases[numberOfCases];

        c.case_no=_case_no;
        c.accused=_accused;
        c.case_id=numberOfCases;

        numberOfCases++;

        return numberOfCases - 1;
    }

    function updateCase(string memory _case_no,string[] memory _accused,uint256 _case_id) public returns (uint256) {
        Case storage c = cases[numberOfCases];

        c.case_no=_case_no;
        c.accused=_accused;
        c.case_id=_case_id;

        numberOfCases++;

        return numberOfCases - 1;
    }


    function viewCases(string memory _case_no) view public returns (string[] memory){
        for(uint i = 0; i < numberOfCases; i++) {
            Case storage item = cases[i];
            if(keccak256(bytes(item.case_no)) == keccak256(bytes(_case_no)))
                return (item.accused);
        }
        string[] memory temp;
        return temp;
    }

    function viewCases_id(uint256 _case_id) view public returns (string[] memory){
        return (cases[_case_id].accused);
    }

    function viewAll(uint256 _case_id) view public returns (string memory,string[] memory,uint){
        return (cases[_case_id].case_no,cases[_case_id].accused,cases[_case_id].case_id);
    }

    // function viewAllAccused(uint256 _case_id) view public returns (string[] memory){
    //     string[] memory temp;
    //     uint256 val=_case_id;
    //     bool flag;
    //     while(cases[val].case_id != val){
    //         for(uint i=0;i<cases[val].accused.length;i++){
    //             flag=false;
    //             for(uint j=0; j< temp.length ; j++){
    //                 if(keccak256(bytes(temp[j])) == keccak256(bytes(cases[val].accused[i])))
    //                     flag=true;
    //             }
    //             if(!flag)
    //                 temp[(temp.length)]=cases[val].accused[i];
    //         }
    //         val=cases[val].case_id;
    //     }
    //     return temp;
    // }


}