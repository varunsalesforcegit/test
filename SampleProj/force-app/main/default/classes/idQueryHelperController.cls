public class idQueryHelperController {
    
 public static void afterInAndEditForQuery(list<ID_Query__c>  iqQertList , String isDelValue){
    system.debug('iqQertList=====>'+iqQertList);
    list<Id> lstOfAccId = new list<Id>();
    list<account> accObjForUpdate = new list<account>();
    list<ID_Query__c> lstQur = new list<ID_Query__c>();
    map<id,list<String>> mapOfIdQuery = new map<id,list<String>>();
    map<id,list<String>> mapOfString= new map<id,list<String>>();
    list<Account> lstOfAcc = new list<Account>();
    for (ID_Query__c idQObj : iqQertList){
        if(idQObj.Account__c != null){            
            lstOfAccId.add(idQObj.Account__c);
        }        
    }
    
    system.debug('lstOfAccId====>'+lstOfAccId);
    
    if(lstOfAccId.size()>0){
        lstOfAcc = [Select id,Name,IdQueryText__c from account where ID IN: lstOfAccId];
        system.debug('lstOfAcc====>'+lstOfAcc);
    }  
    if(lstOfAcc.size()>0 && isDelValue == 'False'){
      lstQur =   [Select id,Name,Account__c,TexAndSales__c from ID_Query__c where Account__c IN: lstOfAcc ];
    }
    if(lstOfAcc.size()>0 && isDelValue == 'True'){
        lstQur =   [Select id,Name,Account__c,TexAndSales__c from ID_Query__c where Account__c IN: lstOfAcc ];
        if(lstQur.size()>0){
            for(integer i=0; i<lstQur.size() ; i++){
                
                for(integer j=0; j<iqQertList.size() ; j++){
                    system.debug('lstQur.get(i).Id=====>'+lstQur.get(i).Id);
                    system.debug('iqQertList.get(j).Id=====>'+iqQertList.get(j).Id);
                    if(lstQur.get(i).Id == iqQertList.get(j).Id ){
                        lstQur.remove(i);
                    }
                }            
            }
        }       

     }
     
    system.debug('lstQur=====>'+lstQur);
    
     if(lstQur.size()>0) {
         for(ID_Query__c idQObj: lstQur){
             if(mapOfIdQuery.containsKey(idQObj.Account__c)){
                 list<string> strValue = new list<string>() ;
                 if(mapOfIdQuery.get(idQObj.Account__c).isEmpty()){
                     strValue = mapOfIdQuery.get(idQObj.Account__c); 
                 }
                 else{
                     strValue = mapOfIdQuery.get(idQObj.Account__c);
                     strValue.add(idQObj.TexAndSales__c);
                 }
                 
                 list<String> internalString = new list<String> ();
                 internalString.addAll(strValue);
                 mapOfIdQuery.put(idQObj.Account__c, internalString); 
             }
             else{
                 mapOfIdQuery.put(idQObj.Account__c,new list<String> {idQObj.TexAndSales__c}); 
             }
         } 
         
         for(Account accObj : lstOfAcc){        
             if(mapOfIdQuery.containsKey(accObj.id)){
                 accObj.IdQueryText__c =  String.join(mapOfIdQuery.get(accObj.id), '\n');
                 accObjForUpdate.add(accObj);
             }        
         }
     }
     else{         
         for(Account accObj : lstOfAcc){        
                 accObj.IdQueryText__c =  '';
                 accObjForUpdate.add(accObj);       
         }
         
     }
    
   update accObjForUpdate;
    }
}