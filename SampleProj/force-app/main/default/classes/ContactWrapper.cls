global class ContactWrapper
{
public Boolean isSelected {get;set;}
public Contact cont{get;set;}        
    public ContactWrapper(Contact cont,Boolean isSelected)
    {
        this.cont= cont;
        this.isSelected= isSelected;
    }
    
}