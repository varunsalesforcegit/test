global with sharing class AccountController {
    @AuraEnabled
    public static Account[] getAccounts() {
        List<account> accounts = new List<account>();
        accounts.add(new Account(Name = 'Account 1'));
        accounts.add(new Account(Name = 'Account 2'));
        accounts.add(new Account(Name = 'Account 3'));
        return accounts;
    }
}