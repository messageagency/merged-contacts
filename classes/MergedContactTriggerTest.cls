@isTest 
private class MergedContactTriggerTest {
    static testMethod void testMergeTrigger() {
       Contact winner = new Contact(LastName = 'Foo', FirstName = 'Foo');
       insert winner;

       Contact loser = new Contact(LastName = 'Bar', FirstName = 'Bar');
       insert loser;
    
       merge winner loser;
       Integer i = [SELECT COUNT() FROM Merged_Contact__c WHERE Contact__c = :winner.Id AND Old_Contact__c = :loser.Id];

       System.assertEquals(1, i);
    }
}