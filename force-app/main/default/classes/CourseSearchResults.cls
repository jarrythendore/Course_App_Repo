/****************************************************
 * @ apex course record query controller
 * get all records
 * 
 ****/
public with sharing class CourseSearchResults {

    @AuraEnabled
    public static List<Course__c> getCourses(string courseLevelId, String coursePositionId){
        try {
            if(!String.isBlank(courseLevelId) && !String.isBlank(coursePositionId)){
                return [SELECT  Id, 
                                Name, 
                                CourseLevel__c, 
                                CourseLevel__r.Name, 
                                Contact__r.Name, 
                                CoursePosition__c, 
                                CoursePosition__r.Name,   
                                Description__c, 
                                img_link__c, 
                                Completion__c, 
                                Category__c,
                                Picture__c,
                                User__c
                                
                        FROM Course__c 
                        WHERE CourseLevel__c =: courseLevelId 
                        AND CoursePosition__c =: coursePositionId  
                        AND User__c =: UserInfo.getUserId() 
                        ORDER BY Name];
            }
            else if(!String.isBlank(courseLevelId)){
                return [SELECT  Id, 
                                Name, 
                                CourseLevel__c, 
                                CourseLevel__r.Name, 
                                Contact__r.Name, 
                                CoursePosition__c, 
                                CoursePosition__r.Name,  
                                Description__c, 
                                img_link__c, 
                                Completion__c, 
                                Category__c,
                                Picture__c,
                                User__c
                                
                FROM Course__c 
                WHERE CourseLevel__c =: courseLevelId 
                AND User__c =: UserInfo.getUserId() 
                ORDER BY Name];
            }
            else if(!String.isBlank(coursePositionId)){
                return [SELECT 
                                Id, 
                                Name, 
                                CourseLevel__c, 
                                CourseLevel__r.Name, 
                                Contact__r.Name, 
                                CoursePosition__c, 
                                CoursePosition__r.Name,  
                                Description__c, 
                                img_link__c, 
                                Completion__c, 
                                Category__c,
                                Picture__c,
                                User__c
                        FROM Course__c 
                        WHERE CoursePosition__c =: coursePositionId 
                        AND User__c =: UserInfo.getUserId() 
                        ORDER BY Name];
            }
            else{
                return [SELECT 
                                Id, 
                                Name, 
                                CourseLevel__c, 
                                CourseLevel__r.Name, 
                                Contact__r.Name, 
                                CoursePosition__c, 
                                CoursePosition__r.Name,  
                                Description__c, 
                                img_link__c, 
                                Completion__c, 
                                Category__c,
                                Picture__c,
                                User__c
                FROM Course__c 
                WHERE User__c =: UserInfo.getUserId()  
                ORDER BY Name];
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}