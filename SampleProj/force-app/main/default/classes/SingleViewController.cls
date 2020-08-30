public class SingleViewController {
    Id recId;
    private integer totalRecs = 0;    
    private integer index = 0;
    private integer blockSize = 1;
    
    public SingleViewController(ApexPages.StandardController controller) {
		 recId = ApexPages.currentPage().getParameters().get('id');
    System.debug('value================>'+recId);
        fetchParentAccAndChildAcc();
       // fetchAllOppts();
        
    }
    
        Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    public ApexPages.StandardSetController setCon {
        
        get{
            if(setCon == null){
                size = 3;
                //string queryString = 'Select Name, Type, BillingCity, BillingState, BillingCountry from Account order by Name';
                //setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
        
    }
    
        public pageReference refresh() {
        setCon = null;
        //fetchParentAccAndChildAcc();
        setCon.setPageNumber(1);
        return null;
    }

    public account parentAccount {get; set ;}
    public list<account> childAccount {get; set ;}
    public list<Opportunity> allOpts  {get; set ;}
    account acc = new account();
    
    
    
    public list<account> fetchParentAccAndChildAcc(){
         acc = [SELECT id,name,ParentId,Parent.Name,Ultimate_Parent__c,Ultimate_account_Id__c from account where id =: recId  ];
        if(acc.Ultimate_account_Id__c != '' && acc.Ultimate_account_Id__c != null){
            
            Id UltiAccId =  Id.valueOf(acc.Ultimate_account_Id__c);
            String s1 = string.valueOf(UltiAccId);            
            String mulId = s1.substring(0,s1.length()-3);
            
            if(UltiAccId == acc.id){
              parentAccount = acc;  
              childAccount = [Select id,name,ParentId,Parent.Name,Ultimate_Parent__c,Ultimate_account_Id__c from account
                              where  Ultimate_account_Id__c =: mulId AND Id !=: UltiAccId];
       
            }
            else {
               parentAccount = [Select id,name,ParentId,Parent.Name,Ultimate_Parent__c,Ultimate_account_Id__c from account
                                where  Id =: UltiAccId];
               childAccount = [Select id,name,ParentId,Parent.Name,Ultimate_Parent__c from account
                               where  (Ultimate_account_Id__c =: mulId) AND (Id !=: UltiAccId)];
            } 
           
        }
		return null;        
    }
    
    public void fetchAllOppts(){
        list<account> allAccList = new list<account>();
        list<Id> accIds = new list<Id> ();
        System.debug('parentAccount======>'+parentAccount);
        System.debug('childAccount======>'+childAccount);
        if(parentAccount!= null){
            allAccList.add(parentAccount);
        }
        if(childAccount!= null){
            allAccList.addAll(childAccount);
        }
         System.debug('allAccList======>'+allAccList);
        if(allAccList.size()>0){
            for(account acc : allAccList ){
             accIds.add(acc.id);   
                 
            }
            allOpts = [SELECT id,Name,AccountId,Account.Name,Amount,CloseDate from Opportunity where AccountId IN: accIds ];
        }
		System.debug('allOpts======>'+allOpts);        
    }
   


}