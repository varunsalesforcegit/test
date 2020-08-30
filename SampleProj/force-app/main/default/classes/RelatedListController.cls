public class RelatedListController {  

          @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Id, Name ,phone,email FROM Contact LIMIT 10];
    }
      
        }