public class LeadProcessor  implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
         String query = 'SELECT Id,Name,LeadSource FROM Lead where  LeadSource = \'Dreamforce\' ';

        return Database.getQueryLocator(query);
        
        
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scope){
         for(Lead leadObj : scope)

         {
             leadObj.LeadSource = 'Dreamforce';            

         }

         update scope;
        
    }
    public void finish(Database.BatchableContext bc){
        
    }

}