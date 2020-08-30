({
	myAction : function(component, event, helper) {
         var recordId = component.get("v.recordId");//LINE 4
		  console.log('recordId of account: '+recordId);
	       // alert(recordId);
		var action =component.get("c.getAllContacts");
        console.log('The action value is: '+action);
         action.setCallback(this, function(a){ 
             
            component.set("v.contacts", a.getReturnValue());
           //  console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
            console.log('The contacts are :'+JSON.stringify(a.getReturnValue()));
          
        });
        $A.enqueueAction(action);
	}
})