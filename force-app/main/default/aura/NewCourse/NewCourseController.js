({
    doInit: function(component, event, helper) {
        // Prepare a new record from template
        component.find("courseRecordCreator").getNewRecord(
            "Course__c", // sObject type (objectApiName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.newCourse");
                var error = component.get("v.newCourseError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                    return;
                }
                console.log("Record template initialized: " + rec.apiName);
            })
        );

        helper.getPicklistValues(component, event);
        
    },

    handleSaveCourse: function(component, event, helper) {
        component.find("courseRecordCreator").saveRecord(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                // record is saved successfully
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Saved",
                    "message": "The record was saved."
                });
                resultsToast.fire();
                component.set("v.showCourseForm", false);
            } else if (saveResult.state === "INCOMPLETE") {
                // handle the incomplete state
                component.set("v.newCourseError",'User is offline, device does not support drafts.');
            } else if (saveResult.state === "ERROR") {
                // handle the error state
                component.set("v.newCourseError",'Problem saving contact, error: ' + JSON.stringify(saveResult.error));
            } else {
                component.set("v.newCourseError",'Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        });
    },

    handleNewClick: function(component, event, helper){
        component.set("v.showCourseForm", true);
    }
})