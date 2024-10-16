@isTest
public with sharing class TheVinylPress {
    // This class will handle the manufacturing of records for testing purposes
    // It will take in an Object, a RecordType, an optional number of records to create,
    // and an optional Map of fields and values to set on the record before saving them.
        // If the Map contains the "Default" key, default values will be set for all required fields 
    // There will be a data purity class (QualityAssurance) creating to ensure all user provided data is valid 
    
    public static void manufacture(String leObject, String leRecordType, Map<String, Object> leDetails){
        //call QualityAssurance to validate that the leObject and leRecordType are both valid
            //If yes
                Integer leOrders = 1;
                massManufacture(leObject, leRecordType, leDetails, leOrders)
            //If no
                // throw an error
    }

    public static void massManufacture(){

    }
}