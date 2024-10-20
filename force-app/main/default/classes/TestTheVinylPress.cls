@isTest
public with sharing class TestTheVinylPress {
    
    @IsTest
    public static void itThrowsAnExceptionGivenInvalidObject() {
        String objectName = 'Bananaphone';
        String recordTypeName = '';
        Map<String,Object> details = new Map<String,Object>{
            'Default' => ''
        };

        Test.startTest();
        try {
            Boolean result = TheVinylPress.manufacture(objectName, recordTypeName, details);
            System.assert(false, 'Expected QualityAssuranceException was not thrown');
        } catch (QualityAssuranceException e) {
            System.assertEquals('Invalid object or record type', e.getMessage(), 'Exception message does not match expected');
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception type thrown: ' + e.getTypeName());
        }
    Test.stopTest();
    }

    @IsTest
    public static void itThrowsAnExceptionGivenEmptyDetailsMap() {
        String objectName = 'Account'; // Using a valid object name
        String recordTypeName = 'Test_Account';
        Map<String,Object> details = new Map<String,Object>();

        Test.startTest();
        try {
            Boolean result = TheVinylPress.manufacture(objectName, recordTypeName, details);
            System.assert(false, 'Expected IllegalArgumentException was not thrown');
        } catch (IllegalArgumentException e) {
            System.assertEquals('Details map cannot be null or empty', e.getMessage(), 'Exception message does not match expected');
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception type thrown: ' + e.getTypeName());
        }
        Test.stopTest();
    }

    @IsTest
    public static void itThrowsAnExceptionGivenNullDetailsMap() {
        String objectName = 'Account';
        String recordTypeName = 'Test_Account';
        Map<String,Object> details = null;

        Test.startTest();
        try {
            Boolean result = TheVinylPress.manufacture(objectName, recordTypeName, details);
            System.assert(false, 'Expected IllegalArgumentException was not thrown');
        } catch (IllegalArgumentException e) {
            System.assertEquals('Details map cannot be null or empty', e.getMessage(), 'Exception message does not match expected');
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception type thrown: ' + e.getTypeName());
        }
        Test.stopTest();
    }
}