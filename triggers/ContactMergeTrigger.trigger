trigger ContactMergeTrigger on Contact (after delete) {
  List<Merged_Contact__c> listMergedContacts = new List<Merged_Contact__c>();
    for(Contact contact : trigger.old) {
        if(String.isNotBlank(contact.MasterRecordId)) { 
            listMergedContacts.add(new Merged_Contact__c(Name = Contact.Name, Contact__c = contact.MasterRecordId, Old_Contact__c = contact.id));
        }         
    }
    if(listMergedContacts.size() > 0) {
        insert listMergedContacts;
    }    
}