public with sharing class TestingObjectController {
	public static List<TestingObject__c> updateTestingObjects() {
		List<TestingObject__c> updatedRecords = new List<TestingObject__c>();

		try {
			List<TestingObject__c> testingObjects = [
				SELECT Id, TestingField__c
				FROM TestingObject__c
			];

			ExtraObject__c latestExtraObject = [
				SELECT ExtraField__c
				FROM ExtraObject__c
				ORDER BY CreatedDate DESC
				LIMIT 1
			];

			for (TestingObject__c testingRecord : testingObjects) {
				testingRecord.TestingField__c = latestExtraObject.ExtraField__c;
			}

			Database.update(testingObjects, true);

			updatedRecords = testingObjects;
		} catch (Exception e) {
			System.debug(e.getMessage());
		}

		return updatedRecords;
	}
}