@isTest
public with sharing class CourseSearchResultsTest {
    public CourseSearchResultsTest() {

    }

    @TestSetup
    static void initData(){
        Account account = new Account(
                Name = 'Facebook'
        );
        insert account;
        Contact contact = new Contact(
                AccountId = account.Id,
                LastName = 'Karl'
        );
        insert contact;

        Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        User u = new User(Alias = 'standt', Email = 'standarduser@testorg.com',
            EmailEncodingKey = 'UTF-8', LastName = 'Testing', LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US', ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles', UserName = 'testsystemadmin@test.com');
        insert u;

        CoursePosition__c cp = new CoursePosition__c(
            Name = 'Software Engineering'
        );

        insert cp;

        CourseLevel__c cl = new CourseLevel__c(
            Name = 'Level 4'
        );
        insert cl;

        List<Course__c> courseList = new List<Course__c>();
        
        for(Integer i=0; i < 10; i++){
            Course__c co = new Course__c();
            co.Contact__c = contact.Id;
            co.CourseLevel__c = cl.Id;
            co.CoursePosition__c = cp.Id;
            co.Completion__c = 22;
            co.Category__c = 'SurperBadge';
            co.Description__c = 'testDescribe';
            co.isActive__c = true;
            co.User__c = u.Id;
            courseList.add(co);
        }

        insert courseList;
    }

    @isTest
    static void TestgetCoursesWithBothId(){
        User adminUser = [SELECT username, Id, Name FROM User WHERE username = 'testsystemadmin@test.com'];
        System.runas(adminUser){
            Test.startTest();
            List<CoursePosition__c> cpList = [SELECT Id, Name FROM CoursePosition__c LIMIT 5];
            List<CourseLevel__c> clList = [SELECT Id, Name FROM CourseLevel__c LIMIT 5];
            List<Course__c> result = CourseSearchResults.getCourses(clList[0].Id, cpList[0].Id);
            System.assertNotEquals(null, result);
            Test.stopTest();
        }
       
    }

    @isTest
    static void TestgetCoursesWithCLId(){
        Test.startTest();
        List<CoursePosition__c> cpList = [SELECT Id, Name FROM CoursePosition__c LIMIT 5];
        List<CourseLevel__c> clList = [SELECT Id, Name FROM CourseLevel__c LIMIT 5];

        List<Course__c> result = CourseSearchResults.getCourses(clList[0].Id, null);
        System.assertNotEquals(null, result);
        Test.stopTest();
    }

    @isTest
    static void TestgetCoursesWithCPId(){
        Test.startTest();
        List<CoursePosition__c> cpList = [SELECT Id, Name FROM CoursePosition__c LIMIT 5];
        List<CourseLevel__c> clList = [SELECT Id, Name FROM CourseLevel__c LIMIT 5];

        List<Course__c> result = CourseSearchResults.getCourses(null, cpList[0].Id);
        System.assertNotEquals(null, result);
        Test.stopTest();
    }

    @isTest
    static void TestgetCoursesWithoutId(){
        Test.startTest();
        List<CoursePosition__c> cpList = [SELECT Id, Name FROM CoursePosition__c LIMIT 5];
        List<CourseLevel__c> clList = [SELECT Id, Name FROM CourseLevel__c LIMIT 5];

        List<Course__c> result = CourseSearchResults.getCourses(null, null);
        System.assertNotEquals(null, result);
        Test.stopTest();
    }
}