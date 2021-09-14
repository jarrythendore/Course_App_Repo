Course_App_Repo

1. Login one Salesforce Dev Hub Org then spin a Scratch Org for develop environment

    sfdx force:org:create -s -f config/project-scratch-def.json -a ticket# -d 30

2. Create SFDX Project in VSCode

    sfdx force:project:create --projectname MyLWC

3. Fetch all metadata From Scratch org

    sfdx force:mdapi:retrieve -r metadata -u my_org_username -k ./manifest/package.xml

4. development

5. run test and Deploy

    sfdx force:source:deploy -p "./PathToMetadata" -l RunSpecifiedTests -r TestClass1,TestClass2 -w 33 --verbose --loglevel fatal



* Screen Shots are added in folder ReadME_Screenshot

* console code added for automatically 


Contact contact = [SELECT Id, Name, Email FROM Contact WHERE Email = 'jarrythendore@gmail.com' LIMIT 1];
User u = [SELECT Id, Name, Email, username FROM User WHERE username = 'ruiqian0001@gmail.com' LIMIT 1];


/*
List<CourseLevel__c> cList = new List<CourseLevel__c>();
List<CoursePosition__c> cpList = new List<CoursePosition__c>();
List<Course__c> courseList = new List<Course__c>();

List<String> categoryNames = new List<String>();
categoryNames.add('SurperBadge');
categoryNames.add('Apex Specialist');
categoryNames.add('Lightning Specialist');
categoryNames.add('Aura Specialist');
categoryNames.add('Admin Specialist');
categoryNames.add('Pordot Specialist');
categoryNames.add('Data Loader Specialist');

for(Integer i = 0; i < 7; i++){
    CourseLevel__c cl = new CourseLevel__c();
    cl.Name = 'Test_Level '+(i+1);
    cList.add(cl);
    
	CoursePosition__c cp = new CoursePosition__c();
	cp.Name = 'Test_Software_Engineering '+(i+1);   
    cpList.add(cp);
}

insert cList;
insert cpList;

for(Integer i = 0; i < 7; i++){
    Course__c co = new Course__c();
    co.Name = 'Test_Course'+i;
    co.Contact__c = contact.Id;
    co.User__c = u.Id;
    co.CourseLevel__c = cList[i].Id;
    co.CoursePosition__c = cpList[i].Id;
    co.Completion__c = (2*i+3);
    co.Category__c = categoryNames[i];
    co.Description__c = 'Test Description '+i;
    co.Picture__c = 'https://adtalem2-dev-ed--c.visualforce.com/resource/CourseLogo/'+(i+1)+'.png';
    courseList.add(co);
}

insert courseList;
*/

Delete [SELECT Id, Name, User__c FROM Course__c WHERE Name LIKE 'Test_Course%' AND User__c =: u.Id];
Delete [SELECT Id, Name FROM CourseLevel__c WHERE Name LIKE 'Test_Level%'];
Delete [SELECT Id, Name FROM CoursePosition__c WHERE Name LIKE 'Test_Software_Engineering%'];
               
