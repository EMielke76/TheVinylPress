@isTest
public with sharing class QualityAssurance {
    //This class will handle validating user provided data

    public static Boolean validateObjectData(String objectName, String recordTypeName) {
        try {
            if (String.isBlank(objectName)) {
                System.debug(LoggingLevel.ERROR, 'An object name must be provided');
                return false;
            }

            // Check if the object exists
            if (!Schema.getGlobalDescribe().containsKey(objectName)) {
                System.debug(LoggingLevel.ERROR, 'The provided object name does not exist: ' + objectName);
                return false;
            }

            // Get the SObjectType for the given object name
            Schema.SObjectType sObjType = Schema.getGlobalDescribe().get(objectName);
        
            // Check if the object supports record types
            if (!sObjType.getDescribe().isCreateable() || sObjType.getDescribe().getRecordTypeInfos().size() <= 1) {
                // Object doesn't support record types or only has the master record type
                if (!String.isBlank(recordTypeName)) {
                    System.debug(LoggingLevel.ERROR, 'The object ' + objectName + ' does not support custom record types');
                    return false;
                }
                return true; // Object is valid, but doesn't use record types
            }

            // Object supports record types, so recordTypeName should be provided
            if (String.isBlank(recordTypeName)) {
                System.debug(LoggingLevel.ERROR, 'A record type name must be provided for object: ' + objectName);
                return false;
            }

            // Query for the record type using both object name and record type name
            List<RecordType> rts = [SELECT Id FROM RecordType WHERE SObjectType = :objectName AND DeveloperName = :recordTypeName LIMIT 1];
        
            if (rts.isEmpty()) {
                System.debug(LoggingLevel.ERROR, 'The provided record type "' + recordTypeName + '" is not valid for the object "' + objectName + '"');
                return false;
            }

            return true; // All validations passed
        } catch (Exception e) {
            // Log any unexpected errors
            System.debug(LoggingLevel.ERROR, 'Unexpected error in validateObjectData: ' + e.getMessage());
            return false;
        }
    }

}