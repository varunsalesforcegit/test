public class conRelController {
    @auraEnabled
public static list<contact> getAllContacts()
    {
        //For demo we limited to random 10 records, we can make them dynamic based on record id
       list<contact> conList =[select id,name,phone,lastName from contact limit 10];
     return conList;
    }

}