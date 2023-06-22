// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;



contract Caseholder{
    uint256 public arren=0;
    mapping(address=>CaseRecords) public caseMapping;
    CaseRecords[] public cases;

    function createCase(string memory _case_no,string[] memory _accused) public{
        CaseRecords newCase=new CaseRecords();
        newCase.CaseInsert(_case_no,_accused);
        cases.push(newCase);
        arren++;
    }



    function updateCase(address contactAddr,string memory _case_no,string[] memory _accused) public{
        CaseRecords _case=CaseRecords(contactAddr);
        _case.CaseInsert(_case_no,_accused);
    }



    function viewCaseNo(address contactAddr) view public returns (string memory){
        CaseRecords _case=CaseRecords(contactAddr);
        return _case.seeNo();
    }


    function viewAccused(address contactAddr) view public returns (string[] memory){
        CaseRecords _case=CaseRecords(contactAddr);
        return _case.seeAccused();
    }
}





contract CaseRecords {
    
    string case_no;
    string[] accused;

    function CaseInsert(string memory _case_no,string[] memory _accused) public {

        case_no=_case_no;
        accused=_accused;
    }


    function seeNo() view public returns (string memory){
        return case_no;
    }


    function seeAccused() view public returns (string[] memory){
        return accused;
    }

}
