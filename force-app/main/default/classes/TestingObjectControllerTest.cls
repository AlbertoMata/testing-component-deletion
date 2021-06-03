@IsTest
public with sharing class TestingObjectControllerTest {
	@IsTest
	static void testTestingObjectsUpdate() {
		List<SObject> insertableRecords = new List<SObject>();
		ExtraObject__c extraRecord = new ExtraObject__c(
			ExtraField__c = 'QFXBR'
		);
		TestingObject__c testingRecord = new TestingObject__c(
			TestingField__c = 'defaultValue'
		);
		TestingObject__c additionalTestingRecord = new TestingObject__c(
			TestingField__c = 'defaultValue'
		);

		insertableRecords.add(testingRecord);
		insertableRecords.add(additionalTestingRecord);
		insertableRecords.add(extraRecord);

		Database.insert(insertableRecords, true);

		Test.startTest();

		List<TestingObject__c> updatedRecords = TestingObjectController.updateTestingObjects();

		for (TestingObject__c updated : updatedRecords) {
			System.assert(
				updated.TestingField__c == extraRecord.ExtraField__c,
				'There is a mismatch between testingRecords and extraRecord.'
			);
		}

		Test.stopTest();
	}

	@IsTest
	static void testUpdateException() {
		List<SObject> insertableRecords = new List<SObject>();
		TestingObject__c testingRecord = new TestingObject__c(
			TestingField__c = 'defaultValue'
		);
		TestingObject__c additionalTestingRecord = new TestingObject__c(
			TestingField__c = 'defaultValue'
		);

		insertableRecords.add(testingRecord);
		insertableRecords.add(additionalTestingRecord);

		Database.insert(insertableRecords, true);

		Test.startTest();

		List<TestingObject__c> updatedRecords = TestingObjectController.updateTestingObjects();

		System.assert(updatedRecords.size() == 0, 'Something unexpected happened');

		Test.stopTest();
	}
}
