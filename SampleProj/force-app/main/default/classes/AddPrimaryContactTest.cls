@isTest
 public class AddPrimaryContactTest {
   
   
     @isTest static void TestList(){
         List<Account> Teste = new List <Account>();
         for(Integer i=0;i<50;i++){
             
             Teste.add(new Account(BillingState = 'CA', name = 'Test'+i));
         }
             for(Integer j=0;j<50;j++){
             
             Teste.add(new Account(BillingState = 'NY', name = 'Test'+j));
         
         }
         insert Teste;
         Contact co = new Contact();
          String state = 'CA';
     AddPrimaryContact apc = new AddPrimaryContact(co, state);
	Test.startTest();
	System.enqueueJob(apc);
     Test.stopTest();
         for (Account t:Teste){
             if( t.BillingState == 'CA'){
               	  
             	System.assertEquals(1, t.Number_of_contacts__c);
            
             
         }
         }      
}
 }