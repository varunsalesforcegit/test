trigger idQueryTrigger on ID_Query__c (After insert,After update,After delete,Before delete) {
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            idQueryHelperController.afterInAndEditForQuery(trigger.new, 'False');
        }       
        
    }
    if(Trigger.isAfter){
        if(trigger.isDelete ){
            system.debug('trigger new===>'+trigger.old);
          idQueryHelperController.afterInAndEditForQuery(trigger.old,'True'); 
        }
        
    }
        
   
    
    

}