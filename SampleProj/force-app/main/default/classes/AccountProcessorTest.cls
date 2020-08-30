@isTest(seeAllData = True)
private class AccountProcessorTest {
    @isTest
    private static void TestaccMethod1(){
        list<Contact> contObjTest = [SELECT id,Name,accountId from Contact where accountId != NULL  LIMIT 50  ];
        list<Id> accIdsTest = new list<Id>();
        For(Contact conTestObj : contObjTest ){        
            accIdsTest.add(conTestObj.accountId);
        }
        Test.startTest();
           AccountProcessor.countContacts(accIdsTest);
        Test.stopTest();
    } 

}