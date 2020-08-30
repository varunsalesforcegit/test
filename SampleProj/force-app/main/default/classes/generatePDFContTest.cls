@isTest
public class generatePDFContTest {
    
    private static testmethod void method1(){
        Account acc = new Account ();
        acc.Name = 'test1';
        insert acc;
        
        ID_Query__c idqObj = new ID_Query__c();
        idqObj.Account__c = acc.Id;
        idqObj.Name = 'TestIdQobj';
        insert idqObj;
        
        ID_Results__c idRes = new ID_Results__c();
        idRes.ID_Query__c = idqObj.id;
		idRes.NPI_Check__c = True;
		idRes.ProviderNPI__c = 'testprovideNPi'       ;
        insert idRes;
		
		        
Test.startTest();

PageReference pageRef = Page.generatePDF;
Test.setCurrentPage(pageRef);
ApexPages.currentPage().getParameters().put('id', idqObj.Id);
//ApexPages.StandardController sc = new ApexPages.StandardController(idqObj);
generatePDFCont e = new generatePDFCont();
system.debug(pageRef);
e.getfetchPdfData();
Test.stopTest();
     


        
                
        
    }
}