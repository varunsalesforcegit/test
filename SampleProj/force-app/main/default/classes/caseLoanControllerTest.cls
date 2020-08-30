@isTest
private class caseLoanControllerTest {
    
    
   private static testMethod void InlineTest()
    {
     List<Case> caseObjList = new list<Case>();
        Case parentCase = new Case ();
            parentCase.Loan_Number__c='1234' ;
            parentCase.Status = 'New';
            parentCase.origin = 'Phone';
            parentCase.Status = 'New';        
           insert parentCase;
        
        for (Integer i = 1; i <= 20; i++){
            Case childCaseObj = new Case ();
            childCaseObj.Loan_Number__c='1234' ;
            childCaseObj.Status = 'New';
            childCaseObj.origin = 'Phone';
            childCaseObj.Status = 'New';
            caseObjList.add(childCaseObj);
            }
        insert caseObjList;
        
        Test.StartTest();

        caseLoanController.fetchCaseWithSameLoanNum(parentCase.id);
        Test.StopTest();
    }
    
    

}