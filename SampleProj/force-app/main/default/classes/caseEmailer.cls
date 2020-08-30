global class caseEmailer implements Messaging.InboundEmailHandler {
  
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          case c = new case(subject = email.subject, description = email.plainTextBody);
          insert c;
          
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          return result;
      }
  }