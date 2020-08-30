global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> LeadList = [SELECT Id,Name,LeadSource FROM Lead where  LeadSource = null LIMIT 300 ];
         List<Lead> LeadUpdateList = new List<Lead>();
        For(Lead leadObj :LeadList ){
            leadObj.LeadSource = 'Dreamforce';
            LeadUpdateList.add(leadObj);
        }
       update LeadUpdateList;
    }

}