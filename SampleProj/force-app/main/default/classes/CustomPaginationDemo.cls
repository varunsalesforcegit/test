public with sharing class CustomPaginationDemo
{

public List<ContactWrapper> lstWrapper {get;set;}
public List<ContactWrapper> lstSetController{get;set;}

CustomIterable obj;

    public CustomPaginationDemo() 
    {
        lstWrapper =  new List<ContactWrapper>();
        lstSetController = new List<ContactWrapper>();

        List<Contact> lstContact = [select id,name from Contact limit 20];
        
        for(Contact cont : lstContact )
        {
            lstWrapper.add(new ContactWrapper(cont ,false));
        }

        obj = new CustomIterable (lstWrapper); 
        obj.setPageSize = 5;
        next();         
    }
    
    
        public Boolean hasNext {
            get 
            {
                return obj.hasNext();
            }
            set;
        }
        
        public Boolean hasPrevious {
            get 
            {
                return obj.hasPrevious();
            }
            set;
        }
        
        public void next() 
        {
            lstSetController = obj.next();
        }
        
        public void previous() 
        {
            lstSetController = obj.previous();
        }
    
}