({
    doInit : function(component, event, helper) {
		
		var hasEvent = $A.get('e.force:createRecord');

        helper.h_getAllCourseLevel(component);
		helper.h_getAllCoursePosition(component);

    },

    onFormSubmit : function(component, event, helper){
		var myEvent = component.getEvent("formsubmit");
		var courselevelcmp = component.find("searchCourseLevelId");
		var courseLevelId = courselevelcmp.get("v.value");

		var coursepositioncmp = component.find("searchCoursePositionId");
		var coursePositionId = coursepositioncmp.get("v.value");
		
        //alert('result::'+courselevelcmp.get("v.value"));
		//alert('>>'+coursePositionId);
		myEvent.setParams({"formData":
			{"courseLevelId" : courseLevelId,
			 "coursePositionId" : coursePositionId}}
		);
		myEvent.fire();
	},

    // handleNewClick : function(component, event, helper){
    //     var createRecordEvent = $A.get('e.force:createRecord');
    //     var courselevelcmp = component.find("searchCourseLevelId");
    //     var courseLevelId = courselevelcmp.get("v.value");

    //     if(courseLevelId == '' || courseLevelId == null){
    //         alert('please choose a course level.');
	// 		return;
    //     }

    //     createRecordEvent.setParams({
	// 		'entityApiName' : 'Course__c',
	// 		'defaultFieldValues': {
	// 			'CourseLevel__c': courseLevelId
	// 		},
	// 	});
    // }
})