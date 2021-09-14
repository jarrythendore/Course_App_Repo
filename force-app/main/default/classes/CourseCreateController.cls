public with sharing class CourseCreateController {
    public CourseCreateController() {

    }

    @AuraEnabled 
    public static Map<String, String> getCategoryFieldValue(){
        Map<String, String> options = new Map<String, String>();
        
        Schema.DescribeFieldResult fieldResult = Course__c.Category__c.getDescribe();
        
        List<Schema.PicklistEntry> pValues = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pValues) {
            
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
    
}