public class ContactsTriggerHandler {
    public static void CountUSContacts(List<Contact> conlist){
        
     Set<Id> accIds = new Set<Id>();
      Map<Id, Integer> USContacts = new Map<Id, Integer>();

        for(Contact con : conlist){
            
            If(con.MailingCountry =='USA'){
                
              accIds.add(con.AccountId);
            }
            if(!USContacts.containskey(con.AccountId)){
                USContacts.put(con.AccountId,1);
                
            }
            else{
                USContacts.put(con.AccountId,USContacts.get(con.AccountId)+1);
            }
        }
      
        List<Account> updateaccs = new List<Account>();
        for(Id accid :accIds ){
            Account acc = new Account(Id = accid);
            acc.Number_of_US_Contacts__c = USContacts.containskey(accid)? USContacts.get(accid):0;updateaccs.add(acc);
            update updateaccs;
        }

    }
    
}