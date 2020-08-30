trigger ClosedOpportunityTrigger on Opportunity (After insert, After Update) {
    list<Task> tskList = new list <Task>();
    
    For(Opportunity OppObj : trigger.new){
        //For(integer i = 0; i<200 ; i++){
        if(OppObj.StageName == 'Closed Won'){
            Task tskObj = new Task();
                
                tskObj.Subject = 'Follow Up Test Task';
                tskObj.Status = 'In Progress';
				tskObj.Priority = 'Normal';
                tskObj.WhatId = OppObj.id;
                tskList.add(tskObj);
            }
            
        //}
        
    }
    Database.Insert (tskList,false);

}