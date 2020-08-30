public class generatePDFCont {

    public generatePDFCont(ApexPages.StandardController controller) {
        
        

    }

    
public wrapClassForPDF accObj{get; set;}
    public list<wrapClassForPDF> idResAndAccWrapLst {get; set;}
    public ID_Query__c idQurRec = new ID_Query__c();
    list<ID_Results__c> idQueryResLst = new list<ID_Results__c>();
    public  Id idofRec;
    

    public generatePDFCont(){
      
    }
        
    public      PageReference  getfetchPdfData(){
		   idofRec = ApexPages.currentPage().getParameters().get('id'); 
       
    idQurRec = [Select id,(Select id,NPI_Check__c,Name,ProviderNPI__c from ID_Results__r),Account__c from ID_Query__c where Id =: idofRec ];

        Account acc = new Account ();
        accObj = new wrapClassForPDF();
        idResAndAccWrapLst = new list<wrapClassForPDF>();
        if(idQurRec.Account__c != null){
         acc = [SELECT id,Name, BillingStreet, BillingCity, BillingState, BillingPostalCode,
                         BillingCountry, BillingLatitude, BillingLongitude,Phone,Fax,Website
                         FROM Account WHERE id =: idQurRec.Account__c];
            
        idQueryResLst = [Select id,NPI_Check__c,Name,ProviderNPI__c from ID_Results__c where ID_Query__c =:idofRec];
            
        system.debug('acc===>'+acc);
        system.debug('idQueryResLst===>'+idQueryResLst);
        idResAndAccWrapLst.add(New wrapClassForPDF(acc,idQueryResLst));
        System.debug('idResAndAccWrapLst===>'+idResAndAccWrapLst);
        }       

        return null;
    }
    
    public class wrapClassForPDF{
        public Account accWrap {get; set;}
        public list<ID_Results__c> lstIdResObj {get; set;} 
       
         public ID_Query__c record {get; set;}
        wrapClassForPDF(){
           
        }
        wrapClassForPDF(Account acc,list<ID_Results__c> lstIdREs ){
             
            this.accWrap =acc;
            this.lstIdResObj = lstIdREs;
             this.record  = new ID_Query__c();
        }
    }

}