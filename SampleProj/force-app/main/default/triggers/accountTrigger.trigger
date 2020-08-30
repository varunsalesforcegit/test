trigger accountTrigger on Account (After insert,After Update) {
    
    for (account acc : trigger.new){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //String s1[] = 'ganesh.salesforce45@gmail.com';
        String [] a1=new String[]{'ganesh.salesforce45@gmail.com'};
            String []s2 = new String[]{'ganeshsalesforce45@gmail.com'};
        mail.setToAddresses(a1); 
        mail.setCcAddresses(s2); 
        mail.setSubject('From Lightning Org');
        mail.setPlainTextBody('PFA');
        mail.setWhatId(acc.Id);
        system.debug('accid====>'+acc.Id);
        List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
        for (Attachment a : [select Name, Body, BodyLength from Attachment where ParentId = :acc.Id])
        {
            // Add to attachment file list
           Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
            efa.setFileName(a.Name);
            efa.setBody(a.Body);
            fileAttachments.add(efa);
        }
        mail.setFileAttachments(fileAttachments);
        system.debug('mail====>'+mail);
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }


}