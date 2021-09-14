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


https://github.com/jarrythendore/Course_App_Repo/blob/main/Console_Code
               
