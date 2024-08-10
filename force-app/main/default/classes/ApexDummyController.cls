public with sharing class ApexDummyController {
	@AuraEnabled
	public static void createRecord() {
		insert new Account(Name = 'Test');
	}
}