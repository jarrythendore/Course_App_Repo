/*********************************************************
 * @ Course Search controller, build for CourseSearchForm 
 * component, functions added for get course level and 
 * course position for Aura cmp
 * 
 * @ created Sep 12, 2021, Rui
 * 
 **************/

public with sharing class CourseSearchFormController {
    public CourseSearchFormController() {

    }

    @AuraEnabled
    public static List<CourseLevel__c> apex_getAllCourseLevel(){
        try {
            return [SELECT Id, Name from CourseLevel__c ORDER BY Name];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<CoursePosition__c> apex_getAllCoursePosition(){
        try {
            return [SELECT Id, Name from CoursePosition__c ORDER BY Name];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}