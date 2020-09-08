public class wrapperAccountOpportunity {
    Id recId;
    public wrapperAccountOpportunity(){
        recId = ApexPages.currentPage().getParameters().get('id');
        //fetchData();
    }
    //commnet added oneonetwothree
    public void fetchData(){
       List<Opportunity> allOpps = [Select name,Id,AccountId from Opportunity ];
        //Parent Id set
        Set<id> parentIdSet = new Set<id>();
        //Create parent Id set 
        for(Opportunity OppertunityRec :allOpps){
        	parentIdSet.add(OppertunityRec.AccountId);
        }
        
        //Fetch all associated parents
        List<Account> allAssocaiatedAccounts = [Select name,id from Account where Id IN : parentIdSet];
        
        wrapperList = new list<myWrapperClass>();
        //For loop to set data
        for(Opportunity childRec : allOpps){
        	for(Account parentRec :allAssocaiatedAccounts){
        		if(parentRec.Id == childRec.AccountId){
        			myWrapperClass wrapRec = new myWrapperClass();
        			wrapRec.acc = parentRec;
        			wrapRec.opp = childRec;
        			wrapperList.add(wrapRec);
        		}
        	}
        } 
    }
 
//Wrapper list 
public List<myWrapperClass> wrapperList {get; set;}
//Your wrapper 
public class myWrapperClass{
	public Account acc{get;set;}
	public Opportunity opp{get;set;}
	public Boolean selected {get; set;} 
	public myWrapperClass() { 
         selected = false; 
      } 
}
}