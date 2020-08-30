public with sharing class caseLoanController {
    public caseLoanController() {

    }

 @AuraEnabled(cacheable = true)
public static List<CaseWrapper> fetchCaseWithSameLoanNum(String caseRecId){
  list<CaseWrapper> caseWrapList = new list<CaseWrapper>(); 
   list<Case> caseList = new list<Case>();  
   list<Case> primaryCase = new list<Case>();
     String s1 ;
    System.debug('caseRecId====>'+caseRecId);

     primaryCase = [SELECT Id,ContactPhone,Type,Loan_Number__c,LastModifiedById,LastModifiedDate,CaseNumber FROM Case where Id =: caseRecId ];
     if(primaryCase.size()>0){
     s1 = primaryCase[0].Loan_Number__c;
     }
     if(!String.isEmpty(s1)){
         for(Case casObj :  [SELECT Id,ContactPhone,Type,Loan_Number__c,LastModifiedById,LastModifiedDate,CaseNumber FROM Case where Loan_Number__c =: s1]){
           CaseWrapper casWrap = new CaseWrapper();
            if(casObj.id != caseRecId ){
                casWrap.Id = casObj.Id;               
                casWrap.url ='/lightning/r/User/'+casObj.Id+'/view'; 
                casWrap.caseNum = casObj.CaseNumber;
                casWrap.caseType = casObj.Type;
                casWrap.casLastModfyDate = casObj.LastModifiedDate;  
                casWrap.casePhnNum = casObj.ContactPhone; 
                casWrap.caseLoanNum = casObj.Loan_Number__c;         
                caseWrapList.add(casWrap); 
             }

         } 
     }
     system.debug('caseWrapList=====>'+ caseWrapList);
       return caseWrapList;
    }


     public class CaseWrapper{
        @AuraEnabled public string url{get;set;}
        @AuraEnabled public string Id{get;set;}
        @AuraEnabled public string caseNum{get;set;}
        @AuraEnabled public string caseType{get;set;}
        @AuraEnabled public Datetime  casLastModfyDate{get;set;}
        @AuraEnabled public string casePhnNum{get;set;}
        @AuraEnabled public string caseLoanNum{get;set;}
    }

    
}