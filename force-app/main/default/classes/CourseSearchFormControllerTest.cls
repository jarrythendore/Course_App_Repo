@isTest
public with sharing class CourseSearchFormControllerTest {
    public CourseSearchFormControllerTest() {

    }

    @isTest
    static void testApex_getAllCourseLevel(){
        List<CourseLevel__c> result = CourseSearchFormController.apex_getAllCourseLevel();
        System.assertNotEquals(null, result);
    }

    @isTest
    static void testApex_getAllCoursePosition(){
        List<CoursePosition__c> result = CourseSearchFormController.apex_getAllCoursePosition();
        System.assertNotEquals(null, result);
    }
}