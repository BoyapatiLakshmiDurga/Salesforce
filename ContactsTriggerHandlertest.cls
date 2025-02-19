@istest
public class ContactsTriggerHandlertest {
    @istest
    public static void CountUSContactstest(){
        
        Account A = new Account(Name = 'AWE', Phone = '1234567');
        Insert A;
        System.Assertequals(0,0, 'nocontacts');
        
        Account acc = new Account(Name = 'AWE', Phone = '1234567');
        insert acc;
        Contact con = new Contact(LastName = 'Lucky', MailingCountry = 'USA', AccountId = acc.Id );
        System.Assertequals(1,1, '1 contact');
        
        Account acc1 = new Account(Name = 'Yehh', Phone = '876543');
        Insert acc1;
        List<Contact> Conlist = new List<Contact>();
        Contact con1 = new Contact(LastName ='Bunny', MailingCountry = 'USA', AccountId = acc1.Id );
        Contact con2 = new Contact(LastName = 'Bugs', MailingCountry = 'USA', AccountId = acc1.Id );
        Conlist.add(con1);
        Conlist.add(con2);
        insert conlist;
        System.Assertequals(2,2, '2 contacts');
             
    }
    
    

}