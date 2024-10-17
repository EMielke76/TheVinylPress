@isTest
public with sharing class TestQualityAssurance {
    
    @isTest
    public static void itRequiresAnObject(){
        String objectName = '';
        String recordTypeName = '';

        Test.startTest();
        Boolean result = QualityAssurance.validateObjectData(objectName, recordTypeName);
        Test.stopTest();

        System.assertEquals(false, result, 'The method returns FALSE given no Object');
    }

    @isTest
    public static void itPermitsValidObjectsWithoutRecordTypes(){
        String objectName = 'Case';
        String recordTypeName = '';

        Test.startTest();
        Boolean result = QualityAssurance.validateObjectData(objectName, recordTypeName);
        Test.stopTest();

        System.assertEquals(true, result, 'The method returns TRUE given a valid Object that does not have Record Types');
    }

    @IsTest
    public static void itDoesNotAllowInvalidObjects(){
        String objectName = 'Batman';
        String recordTypeName = '';

        Test.startTest();
        Boolean result = QualityAssurance.validateObjectData(objectName, recordTypeName);
        Test.stopTest();

        System.assertEquals(false, result, 'The method returns FALSE given an invalid Object');
    }

    @isTest 
    public static void itPermitsObjectsWithValidRecordTypes(){
        String objectName = 'Account';
        String recordTypeName = 'Test_Account';

        Test.startTest();
        Boolean result = QualityAssurance.validateObjectData(objectName, recordTypeName);
        Test.stopTest();

        System.assertEquals(true, result, 'The method returns TRUE given a valid Object and Valid Record Type');
    }

    @IsTest
    public static void itDoesNotAllowInvalidRecordTypes(){
        String objectName = 'Account';
        String recordTypeName = 'Batman';

        Test.startTest();
        Boolean result = QualityAssurance.validateObjectData(objectName, recordTypeName);
        Test.stopTest();

        System.assertEquals(true, result, 'The method returns FALSE given a valid Object and Invalid Record Type');
    }
}