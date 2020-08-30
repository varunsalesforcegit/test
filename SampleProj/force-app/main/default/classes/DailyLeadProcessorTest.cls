@isTest
public class DailyLeadProcessorTest {
     public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
      @testSetup 
    static void setup() {
        List<Lead> LeadList = new List<Lead>();
       
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            LeadList.add(new Lead(LastName='Lead '+i, 
                Company='Company'+i,  Status = 'Open - Not Contacted'));
        }
        insert LeadList;

    }
    
      public static testMethod void testschedule() {
   Test.StartTest();
   DailyLeadProcessor sh1 = new DailyLeadProcessor();

    String sch = '0 0 23 * * ?'; 
    system.schedule('Test Territory Check', sch, sh1); 
    Test.stopTest(); }
    

}