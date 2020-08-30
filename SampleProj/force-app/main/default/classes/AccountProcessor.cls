public class AccountProcessor {
    @future
    public static void countContacts (list<Id> accIds){
        
 	    map<Id,list<Contact>> contactOFAccounts = new   map<Id,list<Contact>>();        
        list<Contact> contObj = [SELECT id,Name,accountId from Contact where accountId =:accIds  ];
        list<Account> accObjList = [Select id,Name,Number_of_Contacts__c from account where id =:accIds ];
        list<Account> finalIdsToUpdate = new list<Account> ();
        
        For(Id eachAccId :accIds){            
            for(Contact conObj :contObj ){
                if(conObj.accountId == eachAccId){
                    if(contactOFAccounts.containsKey(eachAccId)){
                        contactOFAccounts.get(eachAccId).add(conObj);
                    }else{
                        contactOFAccounts.put(eachAccId, new List<Contact>{conObj});
                    }
                }
            }
        }
         
            For(account orgAccObj : accObjList){
                
                 if(contactOFAccounts.containsKey(orgAccObj.id) ){
                	orgAccObj.Number_of_Contacts__c = contactOFAccounts.Values().Size();
                    finalIdsToUpdate.add(orgAccObj);
            	}
                
            }

	    Update finalIdsToUpdate;    
    }

}