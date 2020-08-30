@isTest
public class LeadProcessorTest {

        @testSetup 
    static void setup() {
        List<Lead> LeadList = new List<Lead>();
       
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            LeadList.add(new Lead(LastName='Lead '+i, 
                Company='Company'+i, LeadSource='Dreamforce', Status = 'Open - Not Contacted'));
        }
        insert LeadList;

    }
    
    
       static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        //System.assertEquals(10, [select count() from contact where MailingCity = 'New York']);
    }

}