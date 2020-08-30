trigger idResultTrigger on ID_Results__c (before insert, before update) {
    
    map<ID_Results__c, Id> mapOfresObjAndIdQuery  = new  map<ID_Results__c, Id>();
    map<ID_Query__c, string> mapOfidQueryAndForceId  = new map<ID_Query__c, string>();
    map<Contact, string> mapOfconAndProvider  = new map<Contact, string>();
    list<ID_Results__c> idRessit = new list<ID_Results__c>();
    
    for(ID_Results__c resObj : Trigger.new){        
        mapOfresObjAndIdQuery.put(resObj,resObj.ID_Query__c);        
    }
    
    for(ID_Query__c idQueyObj :[Select id,ForceRecID__c from ID_Query__c where ID IN: mapOfresObjAndIdQuery.values()] ){
        if(idQueyObj.ForceRecID__c != null && idQueyObj.ForceRecID__c != ''  ){
            mapOfidQueryAndForceId.put(idQueyObj,idQueyObj.ForceRecID__c);
        }       
    }
    
    for(contact conObj : [select id,Provider_NPI__c from Contact where id IN : mapOfidQueryAndForceId.values() ]){
        mapOfconAndProvider.put(conObj, conObj.Provider_NPI__c);
    }
    
    for(ID_Results__c resObj : mapOfresObjAndIdQuery.keySet() ){
        for(string strValue : mapOfconAndProvider.values() ){
            if(resObj.ProviderNPI__c == strValue){                
             // idRessit.add(resObj);  
             resObj.NPI_Check__c = True ;
            }              
        }   
        
    }
    
    /*for(ID_Results__c resObj : idRessit){        
        resObj.NPI_Check__c = True ;
    }*/
    
    

}