trigger ContactsTrigger on Contact (after insert, after update) {
    
    ContactsTriggerHandler.CountUSContacts(Trigger.new);
    System.debug(Account.Number_of_US_Contacts__c);

}
