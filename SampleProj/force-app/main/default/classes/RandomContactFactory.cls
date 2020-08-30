public class RandomContactFactory {
    
    public static  List<Contact> generateRandomContacts (integer  intFor ,String strLastName){
     	List<Contact> lstCont = new List<Contact>();
        // insert 10 accounts
        for (Integer i=0;i<intFor;i++) {
            lstCont.add(new Contact(LastName='TestLastNAme'+i, 
                FirstName ='Test'+i ));
        }
     
        return lstCont;
    }

}