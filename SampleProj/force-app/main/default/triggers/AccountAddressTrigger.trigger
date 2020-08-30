trigger AccountAddressTrigger on Account (before insert , before update) {
    
    If(trigger.new.size()>0){
        For(Account accObj : trigger.new){
            if(accObj.Match_Billing_Address__c == True){
              //accObj.Shipping = accObj.BillingAddress ;
              accObj.ShippingStreet = accObj.BillingStreet  ;
              accObj.ShippingCity =  accObj.BillingCity ;
              accObj.ShippingState = accObj.BillingState ;
              accObj.ShippingPostalCode = accObj.BillingPostalCode ;                    
                                        
            }
        }
    }

}