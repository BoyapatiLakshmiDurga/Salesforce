trigger CountUSAContacts on Contact (After insert, After update, After delete, After undelete) {
    
    set<Id> CollectAccIds = new set<Id>();
    
    if(trigger.isinsert|| trigger.isupdate || trigger.isundelete){
        for(Contact con : trigger.new){
            
            if(con.AccountId!=null){
                CollectAccIds.add(con.AccountId);
                
                
            }
        }
    
    }
    if(trigger.isdelete){
        for(Contact con: trigger.old){
            if(con.AccountId!=null){
                CollectAccIds.add(con.AccountId);
                
                 }
            
            
  
        }
    }
     if (CollectAccIds.isEmpty()) {
        return;
    }

Map<Id, Integer> countUSAContactsonacc = new Map<Id, Integer>();
List<Contact> conlist = [SELECT Id, AccountID from contact WHERE AccountId IN :CollectAccIds and MailingCountry IN ('USA','US')];

for(contact con : conlist){
    if(con.AccountId!=null){
        if(!countUSAContactsonacc.containskey(con.AccountId)){
            countUSAContactsonacc.put(con.AccountId, 1);
        } else{
            countUSAContactsonacc.put(con.AccountId,countUSAContactsonacc.get(con.AccountId)+1 );
        }
            
        }
    }
list<Account> accstoupdate = new List<Account>();
For(Id accId : CollectAccIds){
    Account acc = new Account(Id = accId);
    acc.Number_of_USA_Contacts__c = countUSAContactsonacc.containskey(accId) ? countUSAContactsonacc.get(accId): 0; accstoupdate.add(acc);


if(!accstoupdate.isempty()){
    update accstoupdate;
}
}
}